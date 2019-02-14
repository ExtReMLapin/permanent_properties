hook.Add("InitPostEntity", "Restore housesCL", function()
	timer.Create("GetListHouses", 1, 0, function()
		if not (#houses.list > 0) then
			net.Start("houses_gettable")
			net.SendToServer()
			timer.Remove("GetListHouses")
		end
	end)
end)

net.Receive("houses_gettable", function(len, ply)
	houses.list = net.ReadTable()
	hook.Call("UpdatedHouseList")
end)

net.Receive("houses_clipboard", function(len, ply)
	local txt = net.ReadString()
	print(txt)
	SetClipboardText(txt)
end)

net.Receive("houses_getsingletable", function(len, ply)
	local id = net.ReadInt(7)
	local tbl = net.ReadTable()
	local tblsave ;
	if houses and houses.list and houses.list[id] and houses.list[id].panelsdetectors then -- don't regenerate the pixel viewer detector, it takes time and make the menu glitch for 2/FrameTime() sec
		tblsave = houses.list[id].panelsdetectors
	end
	houses.list[id] = tbl
	houses.list[id].panelsdetectors = tblsave
	hook.Call("UpdatedHouseList")
end)
