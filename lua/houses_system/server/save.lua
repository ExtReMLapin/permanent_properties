if not file.Exists("house_system", "DATA") then file.CreateDir( "house_system" ) end

local function createinitfile(dest) -- best hardcoded file 2016.5
	local txt = util.TableToJSON(
	{
		owner	=	"",
		ownername	=	"",
		friendsname	=	{},
		friends	=	{},
		props	=	{},
	}
	, true)

	file.Write(dest, txt)

end

function houses.savehouse(id)
	if not id then return end

	local dest = "house_system/".. string.lower(game.GetMap()).. "_" .. tostring(id) ..".txt"
	local tbl = {}
	tbl.owner = houses.list[id].owner;
	tbl.ownername = houses.list[id].ownername;
	tbl.friends = houses.list[id].friends;
	tbl.friendsname = houses.list[id].friendsname;
	tbl.props = {}
	tbl.props.ents = houses.list[id].props.ents
	tbl.props.angles = houses.list[id].props.angles
	tbl.props.pos = houses.list[id].props.pos
	if houses.list[id].perma == false then
		tbl.selltime = houses.list[id].selltime or houses.daytosaletotimestamp(houses.BuyhouseforHowmanydays) -- in case of you changed it while the server was already started
	end
	local content = util.TableToJSON(tbl,true)
	file.Write(dest, content)
end

function houses.restorehouse(id)
	if not id then return end
	local dest = "house_system/".. string.lower(game.GetMap()).. "_" .. tostring(id) ..".txt"
	if not file.Exists(dest, "DATA") then 
		if houses.debug then MsgC(houses.rgb, "Created save file for house : " .. houses.list[id].name .. " for the first time.\n") end
		createinitfile(dest)
	end

	if houses.debug then MsgC(houses.rgb, "Restoring safefile for house : " .. houses.list[id].name .. " ...") end
	local txt = file.Read(dest, "DATA")
	local tbltmphouse = util.JSONToTable(txt);
	table.Merge(houses.list[id], tbltmphouse);
	if houses.list[id].perma == false and houses.list[id].selltime and houses.list[id].selltime < os.time() then houses.setowner(false,id) end
	if houses.list[id].perma == true and houses.list[id].selltime then houses.list[id].selltime = nil end
	if houses.list[id].perma == false and not houses.list[id].selltime then
		houses.list[id].selltime = houses.daytosaletotimestamp(houses.BuyhouseforHowmanydays) -- version upgrade and var switch
	end
	tbltmphouse = nil;
	if houses.debug then MsgC(houses.rgb, " Done !\n") end
end
