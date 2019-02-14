local map = string.lower(game.GetMap())
local function addMailbox(vector, angle)
	print("gogogo")
	local ent = ents.Create("perma_mailbox")
	ent:SetPos(vector)
	ent:SetAngles(angle)
	ent:Spawn()
	ent:Activate()
end

hook.Add("InitPostEntity", "spawn mailboxes", function()
	if string.StartWith(map, "rp_rockford") then
		addMailbox(Vector( 9459.15, 4129.78, 1544.03 ),Angle( 0, 90, 0 ) )
		addMailbox(Vector( -4476.07, -7073.16, 8.03 ) ,Angle( 0, -90, 0 ) )
		addMailbox(Vector( -2222.57, 5348.59, 536.03 ) , Angle( 0, -135, 0 ) )
		addMailbox(Vector( 12283.81, -9673.82, 320 ) ,Angle( 0, -25, 0 ) )
	end

	if (map == "rp_downtown_v4c_v2") then
		addMailbox(Vector( -1915, -2408.44, -195.97 ), Angle( 0, 90, 0 ))
		addMailbox(Vector( 112.34, -6617.79, -195.97 ) , Angle( 0, 90, 0 ))
		addMailbox( Vector( -3304.75, 2532.09, -195.97 ), Angle( 0, -180, 0 ))
	end


	if (map == "rp_retribution_v2") then
		addMailbox(Vector( -3831.04, 5498.28, -487.97 ),Angle( 0, -90, 0 ))
		addMailbox( Vector( -713.25, -2307.69, -491.97 ),Angle( 0, -145, 0 ) )
		addMailbox( Vector( 5044.81, -1162.04, -503.97 ), Angle( 0, 90, 0 ))
		addMailbox(Vector( 2458.56, -6408.72, -491.97 ) , Angle( 0, 0, 0 ))
	end


	if (map == "rp_evocity_v33x") then
		addMailbox(Vector( 3203.68, 12331.44561324643649863243, 58.546456456456456456 ),Angle( 0, -90, 0 ))
		addMailbox(Vector( -5622.14345645, 13154.56467864556, 185.245645567645 ),Angle( 0, 0, 0 ))
		addMailbox( Vector( -5675.13786456345646564867, -7830.8765611980014519812, 72.064563180645664288645664521873 ),Angle( 0, 180, 0 ) )
		addMailbox(Vector( 218.71, -6825.224545687645456, 64 ) ,Angle( 0, 90, 0 ) )
		
	end

	if (map == "rp_evocity2_v5p") then		
		addMailbox( Vector( 6804.81, 9157.09, -1824 ), Angle( 0, 90, 0 ))
		addMailbox(Vector( -926.88, 2360.81, 76.03 ) , Angle( 0, 0, 0 ))
	end
end)