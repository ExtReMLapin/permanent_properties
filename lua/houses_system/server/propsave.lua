local function vectotbl(vec, isangle)
	if isangle then
		return { math.Round(vec.p,2), math.Round(vec.y,2), math.Round(vec.r,2)}
	else
		return {  math.Round(vec.x), math.Round(vec.y,2), math.Round(vec.z,2)}
	end
end


--local whitelist = {"duplicates", "props"} -- it does NOT add duplication ent exploit, it will only clone it if it's a props, and anyway, you should block the duplicator
local function generateproplist(ply, id)
	local tbl = {}
	tbl.ents = {}
	tbl.pos = {}
	tbl.angles = {}
	tbl._ents = {}

	/*local btbl = cleanup.GetList()[tostring(ply:UniqueID())] -- can't make this work, fuck it
	for k, v in pairs(btbl) do
		if table.HasValue(whitelist, k) then -- can we save this part of the player props ? 
			for k2, v2 in pairs(v) do
				if IsValid(v2) then -- because removed entities are not being removed from the table
					table.insert(tbl.ents, v2:GetModel())
					table.insert(tbl.pos, vectotbl(v2:GetPos(), false))
					table.insert(tbl.angles,vectotbl( v2:GetAngles(), true))

				end
			end
		end
	end*/

	for k, v in pairs(ents.FindByClass("prop_physics")) do
		if not IsValid(v) or v:CPPIGetOwner() != ply then continue end
		local angl = v:GetPos() -- only call the function once
		if not angl:IsInHouse(id) then continue end
		local modelstr = string.gsub(v:GetModel(), "\\", "/")
		table.insert(tbl.ents,modelstr )
		print(v)
		table.insert(tbl._ents, v)
		table.insert(tbl.pos, vectotbl(angl, false))
		table.insert(tbl.angles,vectotbl( v:GetAngles(), true))
	end

	return tbl
end

function houses.saveprops(id)
		if houses.debug then MsgC(houses.rgb, "===Adding prop for house : " .. houses.list[id].name .. " ...") end
		local owner = houses.getowner(id)
		if owner == false then 
			MsgC(houses.rgb, "Player with SteamID " .. houses.list[id].owner .." is not connected !\n")
			return
		end
		houses.list[id].props = generateproplist(owner, id)
		if houses.debug then MsgC(houses.rgb, "Done !\n") end
		houses.savehouse(id)
end

function houses.restoreprops(id, ply)
	if houses.debug then MsgC(houses.rgb, "Restoring props for house : " .. houses.list[id].name .. " ...") end
		if houses.list[id].props.ents and #houses.list[id].props.ents > 0 then 
			houses.list[id].props._ents = {}
			for k, v in pairs(houses.list[id].props.ents) do
				local 	tmpent = ents.Create("prop_physics")
						tmpent:SetModel(v)
						tmpent:SetPos(Vector(houses.list[id].props.pos[k][1], houses.list[id].props.pos[k][2], houses.list[id].props.pos[k][3]))
						tmpent:SetAngles(Angle(houses.list[id].props.angles[k][1], houses.list[id].props.angles[k][2], houses.list[id].props.angles[k][3]))
						tmpent:SetSolid( SOLID_VPHYSICS )
						tmpent:PhysicsInit( SOLID_VPHYSICS )
						tmpent:GetPhysicsObject():EnableMotion(false)
						tmpent:CPPISetOwner(ply)
						table.insert(houses.list[id].props._ents, tmpents);

			end
		else

			MsgC(houses.rgb, "No props found for this house !\n") 
		end

	if houses.debug then MsgC(houses.rgb, "Done !\n") end
end

hook.Add("PlayerInitialSpawn", "RestorePropsHouse", function(ply)
	timer.Simple(3, function()
		if not IsValid(ply) then return end
		for k, v in pairs(houses.list) do
			if v.owner == ply:SteamID() and (not FPP or (not FPP.DisconnectedPlayers[ply:SteamID()])) then
				houses.restoreprops(k, ply)
			end
		end
	end)
end)

timer.Create("HousesCheckSaveProps", 60*5, 0, function()
	if houses.debug then MsgC(houses.rgb, "Started genrating props save ...\n") end
	for k, v in pairs(houses.list) do
		houses.saveprops(k)
	end
end)