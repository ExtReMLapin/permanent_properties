util.AddNetworkString( "houses_gettable" )
util.AddNetworkString( "houses_getsingletable" )
util.AddNetworkString( "houses_command" )
util.AddNetworkString( "houses_clipboard" )

local pairs = pairs
local net = net
local RunString = RunString
local http = http


net.Receive("houses_gettable", function(len, ply)
	if not IsValid(ply) then return end -- spam bots ?
	if houses.debug then MsgC( houses.rgb, "Player " .. ply:Nick() .. " Requested houses list\n") end
	for k, v in pairs(houses.list) do
		houses.BroadcastSingleHousedata(ply, k)
	end

end)

local function housetableclearsend(id)
	local rtable = table.Copy(houses.list[id])
	rtable.doors = nil
	rtable.props = nil
	rtable.bellpos = nil
	return rtable
end


function houses.BroadcastData()
	for k, v in pairs(houses.list) do
		houses.BroadcastSingleHousedata2(k)
	end
end

function houses.BroadcastSingleHousedata(ply, id)
	local rtable = housetableclearsend(id)
	if houses.list[id].perma == false  and houses.list[id].owner != ""  and houses.list[id].selltime then
		rtable.timeleft = houses.list[id].selltime - os.time()
	end
	net.Start("houses_getsingletable")
	net.WriteInt(id, 7)
	net.WriteTable(rtable)
	net.Send(ply)
end

function houses.BroadcastSingleHousedata2(id)
	local rtable = housetableclearsend(id)
	if houses.list[id].perma == false and houses.list[id].owner != ""  and houses.list[id].selltime then
		rtable.timeleft = houses.list[id].selltime - os.time()
	end
	net.Start("houses_getsingletable")
	net.WriteInt(id, 7)
	net.WriteTable(rtable)
	net.Broadcast()
end


local function plygetmoney(ply)
	if gmod.GetGamemode().Name == "Orange Cosmos RP (ZG)" then
		return ply:GetMoney("Wallet")
	end
	return ply:getDarkRPVar("money")
end

local function plyaddmoney(ply, ammount)
	if gmod.GetGamemode().Name == "Orange Cosmos RP (ZG)" then
		return ply:SetMoney("Wallet", ply:GetMoney("Wallet") + ammount)
	end
	ply:addMoney(ammount)
end

net.Receive("houses_command", function(len, ply)

	local id = net.ReadUInt(7)
	local command = net.ReadUInt(4)
	if command == 0 then
		local bell = ents.Create("prop_physics")
		bell:SetPos(houses.list[id].bellpos)
		bell:SetColor(Color(255,255,255,000))
		bell:EmitSound("houses/dbell.mp3", 75, 100, 1, CHAN_ITEM)
		timer.Simple(9, function()
			if IsValid(bell) then bell:Remove() end
		end)
		if houses.HeyItsMeOpenTheDoor then ply:EmitSound( "vo/streetwar/tunnel/male01/c17_06_password01.wav", 75, 100, 1, CHAN_VOICE ) end
		return 
	end
	if command == 5 and ply:IsAdmin() then
		houses.setowner(false, id)
		return 
	end

	if houses.list[id].owner == "" and command == 1 and plygetmoney(ply) >= houses.list[id].price then
		plyaddmoney(ply, -houses.list[id].price)
		houses.setowner(ply, id)
		return 
	end

	if not ply:CanSpawnInHouse(id) then return end -- only buddy and owner commands after this
	if command == 2 then 
		houses.lockdoors(id)
		return
	end
	if command == 3 then 
		houses.unlockdoors(id)
		return
	end
	if command == 8 then
		local tbl1 = net.ReadTable()
		local tbl2 = net.ReadTable()
		houses.list[id].friendsname = tbl1;
		houses.list[id].friends = tbl2;
		houses.savehouse(id)
		houses.BroadcastSingleHousedata2(id);
		return
	end
	if houses.list[id].owner ~= ply:SteamID() then return end

	if command == 7 then
		plyaddmoney(ply, houses.list[id].price * houses.sellratio )
		houses.setowner(false, id)
		return 
	end
	if command == 4 then
		houses.saveprops(id)
	end
	if command == 6 then
		local steamid = net.ReadString()
		for k, v in pairs(player.GetAll()) do
			if v:SteamID() == steamid then 
				houses.setowner(v, id)
				break
			end
		end
	end
end)

function houses.setowner(ply, id, noreset)
	if ply == false then 
		houses.list[id].owner = ""
		houses.list[id].ownername = ""
		houses.list[id].friends = {}
		houses.list[id].friendsname = {}
		houses.list[id].props = {}
		houses.list[id].selltime = nil;
		hook.Run("SoldPermaHouse", id, ply)
	else
		if houses.list[id].owner ~= "" then -- aka if it's a right transfer and not a buy
			for k, v in pairs(houses.list[id].friends) do
				if v == ply:SteamID() then
					table.remove(houses.list[id].friends, k)
					table.remove(houses.list[id].friendsname, k)
					break
				end
			end
			for k, v in pairs(houses.list[id].props._ents or {}) do -- or {} because if not prop saved
				v:CPPISetOwner(ply)
			end
		else
			if houses.BuyhouseforHowmanydays > 0  then -- don't reset timestamp just because he gave you the rights, it does prevent infinite house exploit
				houses.list[id].selltime = houses.daytosaletotimestamp(houses.BuyhouseforHowmanydays) 
			end
		end
		houses.list[id].owner = ply:SteamID()
		houses.list[id].ownername = ply:Nick()
		hook.Run("BoughtPermaHouse", id, ply)
	end
	houses.unlockdoors(id) -- to prevent this : inb4 you buy house, put someone in it, lock every doors, sell it, and he's too poor to fuck back doors and house
	houses.savehouse(id)
	houses.BroadcastSingleHousedata2(id)

end 

if houses.debug then MsgC(houses.rgb, "Restoring all houses...\n") end
for k, v in pairs(houses.list) do
	houses.restorehouse(k)
end
if houses.debug then MsgC(houses.rgb, "Finished restoring all houses !\n") end