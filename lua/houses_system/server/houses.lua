local metaentity = FindMetaTable( "Entity" )
local metavector = FindMetaTable( "Vector" )
local metaplayer = FindMetaTable( "Player" )

function metaentity:IsInHouse(id)
	if not houses.list[id] and houses.debug then return ErrorNoHalt("No ID in ent:IsInHouse(id)") end
	local pos = self:GetPos()
	for k, v in pairs(houses.list[id].boxes) do
		if pos:WithinAABox(v[1], v[2]) then return true end
	end
	return false
end

function houses.generatedoors(id)
	if houses.debug then MsgC(houses.rgb, "==Started generating doors for house ".. houses.list[id].name.. "\n") end
	for k, v in pairs(ents.GetAll()) do
		local class = v:GetClass()
		if (class == "func_door" or class == "func_door_rotating" or class == "prop_door_rotating" or class == "door_breakable") and v:IsInHouse(id) then 
			table.insert(houses.list[id].doors, v)
			if DarkRP then 
				v:setKeysNonOwnable(true) 
				if houses.debug then MsgC(houses.rgb, "===Added and lock door\n") end
			else
				if houses.debug then MsgC(houses.rgb, "===Added door\n") end
			end
		end
	end
end


function metavector:IsInHouse(id)
	if not houses.list[id] and houses.debug then return ErrorNoHalt("No ID in vec:IsInHouse(id)") end
	local pos = self
	for k, v in pairs(houses.list[id].boxes) do
		if pos:WithinAABox(v[1], v[2]) then return true end
	end
	return false
end

function metaplayer:CanSpawnInHouse(id) -- also used for the panel auth rights
	local stm = self:SteamID()
	if (houses.list[id].owner == stm) or table.HasValue(houses.list[id].friends, stm) then 
		return true
	end
	return false
end

function houses.getowner(id)
	if houses.list[id] == "" then return end
	for k, v in pairs(player.GetAll()) do
		if v:SteamID() == houses.list[id].owner then
			return v
		end
	end
	return false
end

local function sanitizedoors(id)
	for k, v in pairs(houses.list[id].doors) do
		if not IsValid(v) then
			houses.list[id].doors[k] = nil
		end
	end
end

function houses.lockdoors(id)
	sanitizedoors(id) -- useful after cleanup of remapped maps
	if #houses.list[id].doors == 0 then houses.generatedoors(id) end
	for k, v in pairs(houses.list[id].doors) do
		if not IsValid(v) then 
			if houses.debug then MsgC(houses.rgb, "Can't find door number #" .. tostring(k) .. " for house #id".. "\n") end
			continue 
		end
		v:Fire("close")
		v:Fire("lock")
	end
end

function houses.unlockdoors(id)
	sanitizedoors(id) -- useful after cleanup of remapped maps
	if #houses.list[id].doors == 0 then houses.generatedoors(id) end
	for k, v in pairs(houses.list[id].doors) do
		if not IsValid(v) then 
			if houses.debug then MsgC(houses.rgb, "Can't find door number #" .. tostring(k) .. " for house #id".. "\n") end
			continue 
		end
		v:Fire("unlock")
	end
end

local function propSpawn(ply, model)
	for k, v in pairs(houses.list) do
		if ply:GetEyeTrace().HitPos:IsInHouse(k) and not ply:CanSpawnInHouse(k) then
			if houses.debug then MsgC(houses.rgb, "Player " .. ply:Nick() .. " tried to spawn prop on a restricted property : ".. houses.list[k].name .. "\n") end
			return false
		end
	end
end

local function propSpawned(ply, model, ent)
	for k, v in pairs(houses.list) do
		if ent:GetPos():IsInHouse(k) and not ply:CanSpawnInHouse(k) then
			if houses.debug then MsgC(houses.rgb, "Player " .. ply:Nick() .. " tried to spawn prop on a restricted property : ".. houses.list[k].name.. "\n") end
			return false
		end
	end
end
hook.Add("PlayerSpawnObject", "Housesystem_SpawnEffect", propSpawn)
hook.Add("PlayerSpawnProp", "Housesystem_SpawnProp", propSpawn) 
hook.Add("PlayerSpawnedProp", "Housesystem_SpawnedProp", propSpawned)


timer.Create("HousesPropSecurity", houses.scanpropsdelay , 0, function()
	for k, v in pairs(ents.GetAll()) do
		if (v:GetClass() ~= "prop_physics") then continue end
		local owner = v:CPPIGetOwner()
		if not IsValid(owner) then continue end
		for k2, v2 in pairs(houses.list) do
			if v:GetPos():IsInHouse(k2) and not owner:CanSpawnInHouse(k2) then
				owner:ChatPrint("You can't spawn props on this property : " .. houses.list[k2].name)
				v:Remove()
			end
		end
	end
end)

hook.Add("InitPostEntity", "HousesCalcDoorslist", function()
	timer.Simple(0.1, function()
		if houses.debug then MsgC(houses.rgb, "Started Generating doors ...\n") end
		for houseid, houses1 in pairs(houses.list) do
			 houses.generatedoors(houseid)
			 houses.lockdoors(houseid)
		end
		include("houses_system/server/network.lua") -- networking system, it's where you get the commands from the 3d panel
	end)
end) 

hook.Add("canKeysUnlock", "housessystemownerbuddy", function(ply, door)
	for k, v in pairs(houses.list) do
		if table.HasValue(v.doors, door) and (v.owner == ply:SteamID() or table.HasValue(v.friends, ply:SteamID())) then -- if player is friend or owner of the house where is the door then
			return true
		end
	end
end)

hook.Add("canKeysLock", "housessystemownerbuddy", function(ply, door)
	for k, v in pairs(houses.list) do
		if table.HasValue(v.doors, door) and (v.owner == ply:SteamID() or table.HasValue(v.friends, ply:SteamID())) then -- if player is friend or owner of the house where is the door then
			return true
		end
	end
end)

if OCRP_Has_Permission then 
	_OCRP_Has_Permission = OCRP_Has_Permission
	function OCRP_Has_Permission (ply, door)
		if door:IsDoor() then
			local found = false
			for k, v in pairs(houses.list) do
				if table.HasValue(v.doors, door) then 
					found = true 
					if ((v.owner == ply:SteamID()) or table.HasValue(v.friends, ply:SteamID())) then
						return true
					end
				end
				if found then return false end
			end
		end
		return _OCRP_Has_Permission(ply, door)
	end
end

hook.Add("canDoorRam", "housessystemownerbuddy", function(ply, trace, ent)
	local class = ent:GetClass()
	if not (class == "func_door" or class == "func_door_rotating" or class == "prop_door_rotating" or class == "door_breakable") then return nil end
	if not ent:getKeysNonOwnable() then return nil end
	local house = false
	for k, v in pairs(houses.list) do 
		if table.HasValue(v.doors, ent) then 
			house = k
		end
	end
	if not house then return nil end
	local found = false
	for k, v in pairs(player.GetAll()) do
		if (table.HasValue(houses.list[house].friends, v:SteamID()) or houses.list[house].owner == v:SteamID()) and v.warranted then -- check for online co-owner/owner
			found = true
		end
	end
	if found then 
		ent:keysUnLock()
		ent:Fire("open", "", .6)
		ent:Fire("setanimation", "open", .6)
		return true  
	end
	return false
end)


timer.Create("extPro:CRS", houses.scanexpiredrentalagreement, 0, function()
	for k, v in pairs(houses.list) do
		if v.perma == false and v.selltime and v.selltime < os.time() then
			houses.setowner(false,k) 
		end
	end
end)