--[[ Video showing you how to add houses ; 
**** https://www.youtube.com/watch?v=5-iauLbOWGM
**** Use the two tools to add panels and zones, and maybe Easy Entity Inspector to place name of the house, if not near the first panel


**** Don't forget about the boxes, it's a table of vectors in a table, because it does support multiple zone.
**** Like if you got a property with an external garage/shack, you can une two zones.


**** About the .boxes vars, if you don't know which vector to put first ONLY IF YOU NEED MULTIPLE BOXES, i got this function for you , just put the follwing code out of the commented part,
**** it's 10 time slower than the gmod function it's overwriting but it's helping you.

local metavector = FindMetaTable( "Vector" )
function metavector:WithinAABox(Start, Stop)
	local Point = self
	local x = ( Point.x > Stop.x and Point.x < Start.x ) or ( Point.x < Stop.x and Point.x > Start.x )
	local y = ( Point.y > Stop.y and Point.y < Start.y ) or ( Point.y < Stop.y and Point.y > Start.y )
	local z = ( Point.z > Stop.z and Point.z < Start.z ) or ( Point.z < Stop.z and Point.z > Start.z )
	return ( x and y and z )
end


--]]

local map = string.lower(game.GetMap())
include("houses_system/server/network.lua")

timer.Simple(1, function()
	for k, v in pairs(houses.list) do
		houses.restorehouse(k) -- guys what the fuck
	end
end)


if string.StartWith(map, "rp_rockford") then -- i don't put the full name or the map for future version and community-version of the map
	local offset =0
	if map == "rp_rockford_open" then
		offset = -(12405.96875+1546.03125)
	end
	local houseid = 1
	houses.list[houseid] = houses.list[houseid] or {} 
	houses.list[houseid].price = 750000
	houses.list[houseid].perma = true
	houses.list[houseid].name = "Magnum Opus" -- very poetic
	houses.list[houseid].boxes = {{Vector( 10439.79, 3111.72, 1544+ offset  ),Vector( 11213.39, 5524.42, 2815.96+ offset  ) },{Vector( 11213.39, 3111.72, 1544 + offset ), Vector( 12089.21, 5382.84, 2815.96 + offset )}} -- example of multizone property
	houses.list[houseid].bellpos = Vector( 11191.96, 5151.58, 1679.22+ offset  )
	houses.list[houseid].panels = {}
	houses.list[houseid].panelpos = {Vector( 11013, 5378, 1640+ offset  ), Vector( 10963.15, 5366, 1640+ offset  ), Vector( 10948.37, 4233, 1640+ offset  ),Vector( 10942, 4218, 1640+ offset  ) }
	houses.list[houseid].panelangle = {Angle(0,180,90), Angle(0,00,90), Angle(0,180,90),Angle(0,-90,90)}
	houses.list[houseid].textpos = Vector( 10950, 5505.03, 1660+ offset  )
	houses.list[houseid].textangle = Angle(0,180,90)
	houses.list[houseid].owner = houses.list[houseid].owner or ""
	houses.list[houseid].ownername = houses.list[houseid].ownername or ""
	houses.list[houseid].friends = houses.list[houseid].friends or {}
	houses.list[houseid].friendsname = houses.list[houseid].friendsname or {}
	houses.list[houseid].doors = houses.list[houseid].doors or {}
	houses.list[houseid].props = houses.list[houseid].props or {}

	houseid = houseid + 1
	houses.list[houseid] = houses.list[houseid] or {} 
	houses.list[houseid].price = 75000
	houses.list[houseid].perma = false
	houses.list[houseid].name = "Breezehome"
	houses.list[houseid].boxes = {{Vector( 10181.43, 425.78, 1544.03+ offset  ),Vector( 11997.43, 2599.06, 2815.96+ offset  ) },}
	houses.list[houseid].bellpos = Vector( 10792.03, 2387.31, 1683.5+ offset  )
	houses.list[houseid].panels = {}
	houses.list[houseid].panelpos = {Vector( 10900, 2625, 1640+ offset  ), Vector( 10861, 2551.96, 1640+ offset  ), Vector( 10613.75, 1726, 1640+ offset  ), Vector( 10663.56, 1738, 1640+ offset  )}
	houses.list[houseid].panelangle = {Angle(0,-90,90), Angle(0,00,90),  Angle(0,00,90), Angle(0,180,90)}
	houses.list[houseid].textpos = Vector( 109275, 2563.03, 1710.14+ offset  )
	houses.list[houseid].textangle = Angle(0,180,90)
	houses.list[houseid].owner = houses.list[houseid].owner or ""
	houses.list[houseid].ownername = houses.list[houseid].ownername or ""
	houses.list[houseid].friends = houses.list[houseid].friends or {}
	houses.list[houseid].friendsname = houses.list[houseid].friendsname or {}
	houses.list[houseid].doors = houses.list[houseid].doors or {}
	houses.list[houseid].props = houses.list[houseid].props or {}

	houseid = houseid + 1
	houses.list[houseid] = houses.list[houseid] or {} 
	houses.list[houseid].price = 35000
	houses.list[houseid].perma = false
	houses.list[houseid].name = "The workshop" -- no no, not the steam one
	houses.list[houseid].boxes = {{Vector( 9532.78, 7147.53, 1544+ offset  ),Vector( 12089.68, 8124, 2815.96+ offset  ) },}
	houses.list[houseid].bellpos = Vector( 10871.96, 7376.15, 1688.56+ offset  )
	houses.list[houseid].panels = {}
	houses.list[houseid].panelpos = {Vector( 10852.43, 7167, 1640 + offset ), Vector( 10773.65, 7177, 1640+ offset  ),Vector( 10585, 7799, 1650+ offset  ),Vector( 10639.06, 7809, 1639.96 + offset )}
	houses.list[houseid].panelangle = {Angle(0,00,90), Angle(0,180,90),  Angle(0,00,90), Angle(0,180,90)}
	houses.list[houseid].textpos = Vector( 10720, 7167, 1677 + offset )
	houses.list[houseid].textangle = Angle(0,0,90)
	houses.list[houseid].owner = houses.list[houseid].owner or ""
	houses.list[houseid].ownername = houses.list[houseid].ownername or ""
	houses.list[houseid].friends = houses.list[houseid].friends or {}
	houses.list[houseid].friendsname = houses.list[houseid].friendsname or {}
	houses.list[houseid].doors = houses.list[houseid].doors or {}
	houses.list[houseid].props = houses.list[houseid].props or {}
 
 	houseid = houseid + 1
 	houses.list[houseid] = houses.list[houseid] or {} 
	houses.list[houseid].price = 750000
	houses.list[houseid].perma = false
	houses.list[houseid].name = "The Golden Valey" -- idk man, i have no idea
	houses.list[houseid].boxes = {{Vector( 7995.46, 4986.65, 1409+ offset  ), Vector( 9495.09, 6516.81, 2815.96 + offset )}}
	houses.list[houseid].bellpos = Vector( 8358.79, 5611.51, 1695.96 + offset )
	houses.list[houseid].panels = {}
	houses.list[houseid].panelpos = {Vector( 8189, 5628.06, 1640 + offset ), Vector( 8201, 5705.4, 1640 + offset ),Vector( 8833, 5646.4, 1640+ offset  ), Vector( 8822, 5689, 1640 + offset )}
	houses.list[houseid].panelangle = {Angle(0,-90,90), Angle(0,90,90),Angle(0,90,90),Angle(0,-90,90)}
	houses.list[houseid].textpos = Vector( 8191, 5637.62, 1676+ offset  )
	houses.list[houseid].textangle = Angle(0,-90,90)
	houses.list[houseid].owner = houses.list[houseid].owner or ""
	houses.list[houseid].ownername = houses.list[houseid].ownername or ""
	houses.list[houseid].friends = houses.list[houseid].friends or {}
	houses.list[houseid].friendsname = houses.list[houseid].friendsname or {}
	houses.list[houseid].doors = houses.list[houseid].doors or {}
	houses.list[houseid].props = houses.list[houseid].props or {}

	houseid = houseid + 1
	houses.list[houseid] = houses.list[houseid] or {} 
	houses.list[houseid].price = 27000
	houses.list[houseid].perma = false
	houses.list[houseid].name = "Cozy nest"
	houses.list[houseid].boxes = {{Vector( 8157.18, 6562.46, 1544+ offset  ), Vector( 9478.18, 8046.03, 2815.96 + offset )}}
	houses.list[houseid].bellpos = Vector( 8466.1, 7192.03, 1695.96+ offset  )
	houses.list[houseid].panels = {}
	houses.list[houseid].panelpos = {Vector( 8167, 7359.81, 1640+ offset  ), Vector( 8178, 7171.93, 1640+ offset  )}
	houses.list[houseid].panelangle = {Angle(0,-90,90), Angle(0,90,90)}
	houses.list[houseid].textpos = Vector( 8167, 7283.9, 1699.43+ offset  )
	houses.list[houseid].textangle = Angle(0,-90,90)
	houses.list[houseid].owner = houses.list[houseid].owner or ""
	houses.list[houseid].ownername = houses.list[houseid].ownername or ""
	houses.list[houseid].friends = houses.list[houseid].friends or {}
	houses.list[houseid].friendsname = houses.list[houseid].friendsname or {}
	houses.list[houseid].doors = houses.list[houseid].doors or {}
	houses.list[houseid].props = houses.list[houseid].props or {}

	houseid = houseid + 1
	houses.list[houseid] = houses.list[houseid] or {} 
	houses.list[houseid].price = 650000
	houses.list[houseid].perma = false
	houses.list[houseid].name = "The Campfire"
	houses.list[houseid].boxes = {{Vector( 8111.31, 680.53, 1408+ offset  ),Vector( 10130.9, 1806.78, 2815.96+ offset  ) },}
	houses.list[houseid].bellpos = Vector( 8764.53, 1363.46, 1692.09+ offset  )
	houses.list[houseid].panels = {}
	houses.list[houseid].panelpos = {Vector( 9142.65, 1474, 1640+ offset  ), Vector( 8959, 1526, 1640+ offset  ),Vector( 9590, 931.53, 1640+ offset  ),Vector( 9601, 860.65, 1640 + offset )}
	houses.list[houseid].panelangle = {Angle(0,-180,90), Angle(0,0,90),Angle(0,-90,90),Angle(0,90,90)}
	houses.list[houseid].textpos = Vector( 9030.28, 1539, 1662.31+ offset  )
	houses.list[houseid].textangle = Angle(0,180,90)
	houses.list[houseid].owner = houses.list[houseid].owner or ""
	houses.list[houseid].ownername = houses.list[houseid].ownername or ""
	houses.list[houseid].friends = houses.list[houseid].friends or {}
	houses.list[houseid].friendsname = houses.list[houseid].friendsname or {}
	houses.list[houseid].doors = houses.list[houseid].doors or {}
	houses.list[houseid].props = houses.list[houseid].props or {}


	houseid = houseid + 1
	houses.list[houseid] = houses.list[houseid] or {} 
	houses.list[houseid].price = 650000
	houses.list[houseid].perma = false
	houses.list[houseid].name = "Nice View"
	houses.list[houseid].boxes = {{Vector( 10828.15, -9357.1, 320 + offset ),Vector( 12257.68, -8390.97, 2815.96 + offset ) },}
	houses.list[houseid].bellpos = Vector( 11776.03, -8863.22, 465.03+ offset  )
	houses.list[houseid].panels = {}
	houses.list[houseid].panelpos = {Vector( 12165, -9080.13, 430 + offset ), Vector( 12150, -9030, 430+ offset  ),Vector( 11262, -8715.63, 430 + offset ),Vector( 11274.03, -8769.13, 430 + offset )}
	houses.list[houseid].panelangle = {Angle(0,90,90), Angle(0,-90,90),Angle(0,-90,90),Angle(0,90,90)}
	houses.list[houseid].textpos = Vector( 12163, -9080.94, 483+ offset  )
	houses.list[houseid].textangle = Angle(0,90,90)
	houses.list[houseid].owner = houses.list[houseid].owner or ""
	houses.list[houseid].ownername = houses.list[houseid].ownername or ""
	houses.list[houseid].friends = houses.list[houseid].friends or {}
	houses.list[houseid].friendsname = houses.list[houseid].friendsname or {}
	houses.list[houseid].doors = houses.list[houseid].doors or {}
	houses.list[houseid].props = houses.list[houseid].props or {}


	houseid = houseid + 1
	houses.list[houseid] = houses.list[houseid] or {} 
	houses.list[houseid].price = 6500000
	houses.list[houseid].perma = false
	houses.list[houseid].name = "Nice Meme"
	houses.list[houseid].boxes = {{Vector( 11499.96, -6016.91, 326.71+ offset  ),Vector( 12924.9, -5039.66, 2815.96+ offset  ) },}
	houses.list[houseid].bellpos = Vector( 12416.03, -5458.82, 471.03 )
	houses.list[houseid].panels = {}
	houses.list[houseid].panelpos = {Vector( 12802, -5690, 430+ offset  ), Vector( 12790, -5646.47, 430+ offset  ),Vector( 11900, -5326.41, 430+ offset  ),Vector( 11913, -5370.94, 430+ offset  )}
	houses.list[houseid].panelangle = {Angle(0,90,90), Angle(0,-90,90),Angle(0,-90,90),Angle(0,90,90)}
	houses.list[houseid].textpos = Vector( 12802, -5658.44, 483+ offset  )
	houses.list[houseid].textangle = Angle(0,90,90)
	houses.list[houseid].owner = houses.list[houseid].owner or ""
	houses.list[houseid].ownername = houses.list[houseid].ownername or ""
	houses.list[houseid].friends = houses.list[houseid].friends or {}
	houses.list[houseid].friendsname = houses.list[houseid].friendsname or {}
	houses.list[houseid].doors = houses.list[houseid].doors or {}
	houses.list[houseid].props = houses.list[houseid].props or {}


	houses.BroadcastData()	-- for dev only maybe, if the file get refreshed, for faster work
	return
end
if (map == "rp_downtown_v4c_v2") then

	local houseid = 1
	houses.list[houseid] = houses.list[houseid] or {} 
	houses.list[houseid].price = 60000
	houses.list[houseid].perma = false
	houses.list[houseid].name = "Old Garage"
	houses.list[houseid].boxes = {{Vector( -2228.41, -7333.47, -201 ),Vector( -1579.69, -6542.22, 282.96 )}}
	houses.list[houseid].bellpos = Vector( -1943.87, -6976.97, -84.36 )
	houses.list[houseid].panels = {}
	houses.list[houseid].panelpos = {Vector( -2100, -6558, -125 ), Vector( -2145, -6570, -125 ), Vector( -1848.82, -6975, -125 ),Vector( -1906, -6989, -125 ) }
	houses.list[houseid].panelangle = {Angle(0,180,90), Angle(0,00,90), Angle(0,180,90),Angle(0,0,90)}
	houses.list[houseid].textpos = Vector( -2170, -6558, -60 )
	houses.list[houseid].textangle = Angle(0,180,90)
	houses.list[houseid].owner = houses.list[houseid].owner or ""
	houses.list[houseid].ownername = houses.list[houseid].ownername or ""
	houses.list[houseid].friends = houses.list[houseid].friends or {}
	houses.list[houseid].friendsname = houses.list[houseid].friendsname or {}
	houses.list[houseid].doors = houses.list[houseid].doors or {}
	houses.list[houseid].props = houses.list[houseid].props or {}


	houseid = houseid + 1
	houses.list[houseid] = houses.list[houseid] or {} 
	houses.list[houseid].price = 42000
	houses.list[houseid].perma = false
	houses.list[houseid].name = "Long range"
	houses.list[houseid].boxes = {{Vector( -3065.97, -7339.97, -197.94 ),Vector( -2301.82, -6711.44, 282.96 )}}
	houses.list[houseid].bellpos = Vector( -2689.69, -7058.79, -39.04 )
	houses.list[houseid].panels = {}
	houses.list[houseid].panelpos = {Vector( -2368.04, -7078, -94 ), Vector( -2416.04, -7085, -94 )}
	houses.list[houseid].panelangle = {Angle(0,180,90), Angle(0,00,90)}
	houses.list[houseid].textpos = Vector( -2363.25, -7079.97, -58.72 )
	houses.list[houseid].textangle = Angle(0,180,90)
	houses.list[houseid].owner = houses.list[houseid].owner or ""
	houses.list[houseid].ownername = houses.list[houseid].ownername or ""
	houses.list[houseid].friends = houses.list[houseid].friends or {}
	houses.list[houseid].friendsname = houses.list[houseid].friendsname or {}
	houses.list[houseid].doors = houses.list[houseid].doors or {}
	houses.list[houseid].props = houses.list[houseid].props or {}

	houseid = houseid + 1
	houses.list[houseid] = houses.list[houseid] or {} 
	houses.list[houseid].price = 75300
	houses.list[houseid].perma = false
	houses.list[houseid].name = "Good Neighbor"
	houses.list[houseid].boxes = {{Vector( -982.91, -5898.85, -199.97 ),Vector( -485.79, -4896.66, 282.96 )}}
	houses.list[houseid].bellpos = Vector( -739.04, -5655.04, -83.82 )
	houses.list[houseid].panels = {}
	houses.list[houseid].panelpos = {Vector( -950, -5956.44, -125 ), Vector( -930, -5869.63, -125 ),Vector( -573.04, -5510.47, -125 ),Vector( -540, -5440, -125 )}
	houses.list[houseid].panelangle = {Angle(0,70,90), Angle(0,90,90),Angle(0,-90,90),Angle(0,-130,90)}
	houses.list[houseid].textpos =  Vector( -916.22003173828, -5895.03125, -62.688079833984 )
	houses.list[houseid].textangle = Angle(0,360,90)
	houses.list[houseid].owner = houses.list[houseid].owner or ""
	houses.list[houseid].ownername = houses.list[houseid].ownername or ""
	houses.list[houseid].friends = houses.list[houseid].friends or {}
	houses.list[houseid].friendsname = houses.list[houseid].friendsname or {}
	houses.list[houseid].doors = houses.list[houseid].doors or {}
	houses.list[houseid].props = houses.list[houseid].props or {}

	houseid = houseid + 1
	houses.list[houseid] = houses.list[houseid] or {} 
	houses.list[houseid].price = 61000
	houses.list[houseid].perma = false
	houses.list[houseid].name = "Red Bricks"
	houses.list[houseid].boxes = {{Vector( 1771.62, 2513.68, -201 ),Vector( 2336.18, 3112, 167.96 )}}
	houses.list[houseid].bellpos = Vector( 1900.93, 2810.43, -72.04 )
	houses.list[houseid].panels = {}
	houses.list[houseid].panelpos = {Vector( 2225, 2642, -125 ), Vector( 2210, 2695, -125 )}
	houses.list[houseid].panelangle = {Angle(0,90,90), Angle(0,-90,90)}
	houses.list[houseid].textpos = Vector( 2323, 2821.15, -101.13 )
	houses.list[houseid].textangle = Angle(0,90,90)
	houses.list[houseid].owner = houses.list[houseid].owner or ""
	houses.list[houseid].ownername = houses.list[houseid].ownername or ""
	houses.list[houseid].friends = houses.list[houseid].friends or {}
	houses.list[houseid].friendsname = houses.list[houseid].friendsname or {}
	houses.list[houseid].doors = houses.list[houseid].doors or {}
	houses.list[houseid].props = houses.list[houseid].props or {}

	houseid = houseid + 1
	houses.list[houseid] = houses.list[houseid] or {} 
	houses.list[houseid].price = 173000
	houses.list[houseid].perma = false
	houses.list[houseid].name = "High View"
	houses.list[houseid].boxes = {{Vector( -1055.04, -1306.6, 330.4 ), Vector( -703.63, -918.97, 580.46 )}}
	houses.list[houseid].bellpos = Vector( -758.6, -1070.25, 415.09 )
	houses.list[houseid].panels = {}
	houses.list[houseid].panelpos = {Vector( -750, -1305, 400 ), Vector( -825, -1286.5, 400 ),Vector( -790.07, -936.04, 405 ),Vector( -860, -917, 385 )}
	houses.list[houseid].panelangle = {Angle(0,-10,90), Angle(0,180,90), Angle(0,0,90),  Angle(0,180,90)}
	houses.list[houseid].textpos = Vector( -750, -1305, 430 )
	houses.list[houseid].textangle = Angle(0,-10,90)
	houses.list[houseid].owner = houses.list[houseid].owner or ""
	houses.list[houseid].ownername = houses.list[houseid].ownername or ""
	houses.list[houseid].friends = houses.list[houseid].friends or {}
	houses.list[houseid].friendsname = houses.list[houseid].friendsname or {}
	houses.list[houseid].doors = houses.list[houseid].doors or {}
	houses.list[houseid].props = houses.list[houseid].props or {}

	houseid = houseid + 1
	houses.list[houseid] = houses.list[houseid] or {} 
	houses.list[houseid].price = 90000
	houses.list[houseid].perma = false
	houses.list[houseid].name = "Sp00ky alley"
	houses.list[houseid].boxes = {{Vector( -1149, 1446, -197 ), Vector( -769.66, 1992.03, -28.69 )}}
	houses.list[houseid].bellpos = Vector( -978.07, 1631.03, -102.04 )
	houses.list[houseid].panels = {}
	houses.list[houseid].panelpos = {Vector( -778.54, 1994, -125 ), Vector( -961.63, 1983.96, -125 )}
	houses.list[houseid].panelangle = {Angle(0,180,90), Angle(0,0,90)}
	houses.list[houseid].textpos = Vector( -772.91, 1994, -61.66 )
	houses.list[houseid].textangle = Angle(0,180,90)
	houses.list[houseid].owner = houses.list[houseid].owner or ""
	houses.list[houseid].ownername = houses.list[houseid].ownername or ""
	houses.list[houseid].friends = houses.list[houseid].friends or {}
	houses.list[houseid].friendsname = houses.list[houseid].friendsname or {}
	houses.list[houseid].doors = houses.list[houseid].doors or {}
	houses.list[houseid].props = houses.list[houseid].props or {}

	houseid = houseid + 1
	houses.list[houseid] = houses.list[houseid] or {} 
	houses.list[houseid].price = 135000
	houses.list[houseid].perma = false
	houses.list[houseid].name = "PARKER Industries"
	houses.list[houseid].boxes = {{ Vector( -3294.4450683594, 2648.3776855469, -201 ), Vector( -2271.7490234375, 3413.0207519531, 53 )}}
	houses.list[houseid].bellpos = Vector( -2845.03125, 2737.6240234375, -70.797073364258 )
	houses.list[houseid].panels = {}
	houses.list[houseid].panelpos = { Vector( -3287.03125, 3239.4621582031, -135 ), Vector( -3274.96875, 3351.5893554688, -135 ), Vector( -3274.96875, 2726.234375, -135 ), }
	houses.list[houseid].panelangle = { Angle( 0, 270, 90 ), Angle( 0, 90, 90 ), Angle( 0, 90, 90 ), }
	houses.list[houseid].textpos = Vector( -3287.03125, 3239.4621582031, -105 )
	houses.list[houseid].textangle = Angle(0,270,90)
	houses.list[houseid].owner = houses.list[houseid].owner or ""
	houses.list[houseid].ownername = houses.list[houseid].ownername or ""
	houses.list[houseid].friends = houses.list[houseid].friends or {}
	houses.list[houseid].friendsname = houses.list[houseid].friendsname or {}
	houses.list[houseid].doors = houses.list[houseid].doors or {}
	houses.list[houseid].props = houses.list[houseid].props or {}

	houseid = houseid + 1
	houses.list[houseid] = houses.list[houseid] or {} 
	houses.list[houseid].price = 130000
	houses.list[houseid].perma = false
	houses.list[houseid].name = "High Mount"
	houses.list[houseid].boxes = {{ Vector( -590.10174560547, -7154.3, 75.5 ), Vector( -238.38250732422, -6703.32421875, 282.96875 )}}
	houses.list[houseid].bellpos = Vector( -410.96875, -7025.2177734375, 199.40049743652 )
	houses.list[houseid].panels = {}
	houses.list[houseid].panelpos = { Vector( -294.99404907227, -7159.03125, 150 ), Vector( -239.75076293945, -7148.96875, 150 ), }
	houses.list[houseid].panelangle = { Angle( 0, 360, 90 ), Angle( 0, 180, 90 ), }
	houses.list[houseid].textpos = Vector( -294.99404907227, -7159.03125, 180 )
	houses.list[houseid].textangle = Angle(0,360,90)
	houses.list[houseid].owner = houses.list[houseid].owner or ""
	houses.list[houseid].ownername = houses.list[houseid].ownername or ""
	houses.list[houseid].friends = houses.list[houseid].friends or {}
	houses.list[houseid].friendsname = houses.list[houseid].friendsname or {}
	houses.list[houseid].doors = houses.list[houseid].doors or {}
	houses.list[houseid].props = houses.list[houseid].props or {}


	houses.BroadcastData()
	return
end


if (map == "rp_retribution_v2") then
	local houseid = 1
	houses.list[houseid] = houses.list[houseid] or {} 
	houses.list[houseid].price = 60000
	houses.list[houseid].perma = false
	houses.list[houseid].name = "Cozy nest"
	houses.list[houseid].boxes = {{Vector( 5631.37, -354.82, -503.97 ),Vector( 6165.84, 210.93, 191.96 )}}
	houses.list[houseid].bellpos = Vector( 5879.46, -0.04, -391.57 )
	houses.list[houseid].panels = {}
	houses.list[houseid].panelpos = {Vector( 5822.93, -353, -430 ), Vector( 5875, -342, -430 ),Vector( 5629, 73.21, -430 )}
	houses.list[houseid].panelangle = {Angle(0,0,90), Angle(0,180,90), Angle(0,-90, 90),}
	houses.list[houseid].textpos = Vector( 5821.37, -352.04, -398.22 )
	houses.list[houseid].textangle = Angle(0,0,90)
	houses.list[houseid].owner = houses.list[houseid].owner or ""
	houses.list[houseid].ownername = houses.list[houseid].ownername or ""
	houses.list[houseid].friends = houses.list[houseid].friends or {}
	houses.list[houseid].friendsname = houses.list[houseid].friendsname or {}
	houses.list[houseid].doors = houses.list[houseid].doors or {}
	houses.list[houseid].props = houses.list[houseid].props or {}


	houseid = houseid + 1
	houses.list[houseid] = houses.list[houseid] or {} 
	houses.list[houseid].price = 959000
	houses.list[houseid].perma = false
	houses.list[houseid].name = "The Mountain"
	houses.list[houseid].boxes = {{Vector( 6884.31, 129.03, -703 ),Vector( 8211.15, 1033.25, 191.96 )}}
	houses.list[houseid].bellpos = Vector( 7550.93, 648.03, -359.38 )
	houses.list[houseid].panels = {}
	houses.list[houseid].panelpos = {Vector( 7510, 190, -400 ), Vector( 7738.03, 209, -400 ),Vector( 7979.62, 833, -400 ), Vector( 8095.93, 833, -400 )}
	houses.list[houseid].panelangle = {Angle(0,0,90), Angle(0,180,90), Angle(0,180,90),Angle(0,180,90)}
	houses.list[houseid].textpos = Vector( 7514.81, 191.96, -333.72 )
	houses.list[houseid].textangle = Angle(0,0,90)
	houses.list[houseid].owner = houses.list[houseid].owner or ""
	houses.list[houseid].ownername = houses.list[houseid].ownername or ""
	houses.list[houseid].friends = houses.list[houseid].friends or {}
	houses.list[houseid].friendsname = houses.list[houseid].friendsname or {}
	houses.list[houseid].doors = houses.list[houseid].doors or {}
	houses.list[houseid].props = houses.list[houseid].props or {}


	houseid = houseid + 1
	houses.list[houseid] = houses.list[houseid] or {} 
	houses.list[houseid].price = 450000
	houses.list[houseid].perma = false
	houses.list[houseid].name = "Safe house" -- almost
	houses.list[houseid].boxes = {{Vector( 5944.75, -10134.38, -387),Vector( 7022.5, -9390.44, 255.96 )}}
	houses.list[houseid].bellpos = Vector( 6352.03, -9712.29, -133.32 )
	houses.list[houseid].panels = {}
	houses.list[houseid].panelpos = {Vector( 6457.5, -10115.35, -172 ), Vector( 6517.34, -10093.97, -172 ),Vector( 6958, -9761.82, -310),}
	houses.list[houseid].panelangle = {Angle(0,0,90), Angle(0,180,90), Angle(0,-90,90)}
	houses.list[houseid].textpos = Vector( 6210.43, -10115.35, -170 )
	houses.list[houseid].textangle = Angle(0,0,90)
	houses.list[houseid].owner = houses.list[houseid].owner or ""
	houses.list[houseid].ownername = houses.list[houseid].ownername or ""
	houses.list[houseid].friends = houses.list[houseid].friends or {}
	houses.list[houseid].friendsname = houses.list[houseid].friendsname or {}
	houses.list[houseid].doors = houses.list[houseid].doors or {}
	houses.list[houseid].props = houses.list[houseid].props or {}

	houseid = houseid + 1
	houses.list[houseid] = houses.list[houseid] or {} 
	houses.list[houseid].price = 750000
	houses.list[houseid].perma = false
	houses.list[houseid].name = "The Kebab Remover" -- remove kebab my friend
	houses.list[houseid].boxes = {{Vector( -6789.22, 14124.37, -315.25 ),Vector( -5869.54, 14628.31, 191.96 )}}
	houses.list[houseid].bellpos = Vector( -6399.97, 14394.96, -220.63 )
	houses.list[houseid].panels = {}
	houses.list[houseid].panelpos = {Vector( -6620, 14206, -230 ), Vector( -6566, 14219.68, -220 ),}
	houses.list[houseid].panelangle = {Angle(0,0,90), Angle(0,90,90), Angle(0,-90,90)}
	houses.list[houseid].textpos = Vector( -6621.13, 14207.96, -172.94 )
	houses.list[houseid].textangle = Angle(0,0,90)
	houses.list[houseid].owner = houses.list[houseid].owner or ""
	houses.list[houseid].ownername = houses.list[houseid].ownername or ""
	houses.list[houseid].friends = houses.list[houseid].friends or {}
	houses.list[houseid].friendsname = houses.list[houseid].friendsname or {}
	houses.list[houseid].doors = houses.list[houseid].doors or {}
	houses.list[houseid].props = houses.list[houseid].props or {}


	houseid = houseid + 1
	houses.list[houseid] = houses.list[houseid] or {} 
	houses.list[houseid].price = 250000
	houses.list[houseid].perma = false
	houses.list[houseid].name = "no grill allowed" -- animefag kid
	houses.list[houseid].boxes = {{Vector( -2830.57, 5884.31, -487.97 ),Vector( -2077.79, 6967.84, 319.96 )}}
	houses.list[houseid].bellpos = Vector( -2457.38, 6160.03, -335.1 )
	houses.list[houseid].panels = {}
	houses.list[houseid].panelpos = {Vector( -2817.04, 6585, -375 ),Vector( -2798, 6520.15, -375 ),}
	houses.list[houseid].panelangle = {Angle(0,-90,90), Angle(0,90,90), Angle(0,-90,90)}
	houses.list[houseid].textpos = Vector( -2817, 6591.09, -331.5 )
	houses.list[houseid].textangle = Angle(0,-90,90)
	houses.list[houseid].owner = houses.list[houseid].owner or ""
	houses.list[houseid].ownername = houses.list[houseid].ownername or ""
	houses.list[houseid].friends = houses.list[houseid].friends or {}
	houses.list[houseid].friendsname = houses.list[houseid].friendsname or {}
	houses.list[houseid].doors = houses.list[houseid].doors or {}
	houses.list[houseid].props = houses.list[houseid].props or {}


	houseid = houseid + 1
	houses.list[houseid] = houses.list[houseid] or {} 
	houses.list[houseid].price = 250000
	houses.list[houseid].perma = false
	houses.list[houseid].name = "Fairview"
	houses.list[houseid].boxes = {{Vector( 1701.78, -7137.13, -513 ),Vector( 2211.56, -6475.85, 383.96 )}, {Vector( 2177.31, -7094.79, -360 ),Vector( 2298.53, -6828.41, -185.72 ) }} -- 2nd is for balcoon
	houses.list[houseid].bellpos = Vector( 1920.03, -6843.63, -373.41 )
	houses.list[houseid].panels = {}
	houses.list[houseid].panelpos = {Vector( 2177.5, -6685.41, -419 ),Vector( 2167.96, -6631.6, -419 )}
	houses.list[houseid].panelangle = {Angle(0,90,90), Angle(0,-90,90)}
	houses.list[houseid].textpos = Vector( 2177.5, -6673.16, -358 )
	houses.list[houseid].textangle = Angle(0,90,90)
	houses.list[houseid].owner = houses.list[houseid].owner or ""
	houses.list[houseid].ownername = houses.list[houseid].ownername or ""
	houses.list[houseid].friends = houses.list[houseid].friends or {}
	houses.list[houseid].friendsname = houses.list[houseid].friendsname or {}
	houses.list[houseid].doors = houses.list[houseid].doors or {}
	houses.list[houseid].props = houses.list[houseid].props or {}


	houseid = houseid + 1
	houses.list[houseid] = houses.list[houseid] or {} 
	houses.list[houseid].price = 150000
	houses.list[houseid].perma = false
	houses.list[houseid].name = "Road view"
	houses.list[houseid].boxes = {{ Vector( 5155.9614257813, -1812.981647896894531, -503.96875 ), Vector( 5696.3662109375, -1174.5681152344, 191.96875 )}}
	houses.list[houseid].bellpos = Vector( 5433.5283203125, -1599.96875, -382.7633972168 )
	houses.list[houseid].panels = {}
	houses.list[houseid].panelpos = { Vector( 5623.0297851563, -1213.9682456842375, -434.5476561198001451981112  ), Vector( 5446.083496093568704560, -1226.03125, -434 ), Vector( 5685.96875, -1605.1684570313, -434 ), Vector( 5698.03125, -1783.8541259766, -434 ), }
	houses.list[houseid].panelangle = { Angle( 0, 180, 90 ), Angle( 0, 360, 90 ), Angle( 0, 270, 90 ), Angle( 0, 90, 90 ), }
	houses.list[houseid].textpos = Vector( 5623.0297851563, -1213.96875, -400 )
	houses.list[houseid].textangle = Angle(0,180,90)
	houses.list[houseid].owner = houses.list[houseid].owner or ""
	houses.list[houseid].ownername = houses.list[houseid].ownername or ""
	houses.list[houseid].friends = houses.list[houseid].friends or {}
	houses.list[houseid].friendsname = houses.list[houseid].friendsname or {}
	houses.list[houseid].doors = houses.list[houseid].doors or {}
	houses.list[houseid].props = houses.list[houseid].props or {}

	houseid = houseid + 1
	houses.list[houseid] = houses.list[houseid] or {} 
	houses.list[houseid].price = 150000
	houses.list[houseid].perma = false
	houses.list[houseid].name = "Honeyside"
	houses.list[houseid].boxes = {{ Vector( -4703.4106445313, 6131.6879882813, -511.96875 ), Vector( -3910.7106933594, 6544.8286132813, 319.96878051758 )}}
	houses.list[houseid].bellpos = Vector( -4388.8203125, 6248.03125, -370.99465942383 )
	houses.list[houseid].panels = {}
	houses.list[houseid].panelpos = { Vector( -3965.96875, 6224.5849609375, -415 ), Vector( -3986.03125, 6267.34375, -415 ), }
	houses.list[houseid].panelangle = { Angle( 0, 90, 90 ), Angle( 0, 270, 90 ), }
	houses.list[houseid].textpos = Vector( -3965.96875, 6224.5849609375, -350 )
	houses.list[houseid].textangle = Angle(0,90,90)
	houses.list[houseid].owner = houses.list[houseid].owner or ""
	houses.list[houseid].ownername = houses.list[houseid].ownername or ""
	houses.list[houseid].friends = houses.list[houseid].friends or {}
	houses.list[houseid].friendsname = houses.list[houseid].friendsname or {}
	houses.list[houseid].doors = houses.list[houseid].doors or {}
	houses.list[houseid].props = houses.list[houseid].props or {}



	houses.BroadcastData()
	return
end


if (map == "rp_evocity_v33x") then
	local houseid = 1
	houses.list[houseid] = houses.list[houseid] or {} 
	houses.list[houseid].price = 80000
	houses.list[houseid].perma = false
	houses.list[houseid].name = "Cozy nest"
	houses.list[houseid].boxes = {{ Vector( 4509.2094726563, 13543.0390625, 0 ), Vector( 5829.8266601563, 15176.849609375, 948.96875 )}}
	houses.list[houseid].bellpos = Vector( 5099.361328125, 13893.03125, 172.01824951172 )
	houses.list[houseid].panels = {}
	houses.list[houseid].panelpos = { Vector( 4998.42578125, 13650.96875, 165 ), Vector( 5049.2758789063, 13663.03125, 165 ), }
	houses.list[houseid].panelangle = { Angle( 0, 360, 90 ), Angle( 0, 180, 90 ), }
	houses.list[houseid].textpos =  Vector( 5000, 13650.96875, 200 )
	houses.list[houseid].textangle = Angle(0,0,90)
	houses.list[houseid].owner = houses.list[houseid].owner or ""
	houses.list[houseid].ownername = houses.list[houseid].ownername or ""
	houses.list[houseid].friends = houses.list[houseid].friends or {}
	houses.list[houseid].friendsname = houses.list[houseid].friendsname or {}
	houses.list[houseid].doors = houses.list[houseid].doors or {}
	houses.list[houseid].props = houses.list[houseid].props or {}



	houseid = houseid + 1
	houses.list[houseid] = houses.list[houseid] or {} 
	houses.list[houseid].price = 60000
	houses.list[houseid].perma = false
	houses.list[houseid].name = "Lake View"
	houses.list[houseid].boxes = {{ Vector( -13928.737304688, 11834.888671875, 183 ), Vector( -13394.30078125, 12572.802734375, 948.96875 )}}
	houses.list[houseid].bellpos = Vector( -13702.818359375, 12205.96875, 344.73419189453 )
	houses.list[houseid].panels = {}
	houses.list[houseid].panelpos = { Vector( -13835.165039063, 11883.96875, 310 ), Vector( -13648.283203125, 11896.03125, 310 ), }
	houses.list[houseid].panelangle = { Angle( 0, 360, 90 ), Angle( 0, 180, 90 ), }
	houses.list[houseid].textpos =  Vector( -13835.165039063, 11883.96875, 370 )
	houses.list[houseid].textangle = Angle(0,0,90)
	houses.list[houseid].owner = houses.list[houseid].owner or ""
	houses.list[houseid].ownername = houses.list[houseid].ownername or ""
	houses.list[houseid].friends = houses.list[houseid].friends or {}
	houses.list[houseid].friendsname = houses.list[houseid].friendsname or {}
	houses.list[houseid].doors = houses.list[houseid].doors or {}
	houses.list[houseid].props = houses.list[houseid].props or {}


	houseid = houseid + 1
	houses.list[houseid] = houses.list[houseid] or {} 
	houses.list[houseid].price = 145000
	houses.list[houseid].perma = false
	houses.list[houseid].name = "Cottage"
	houses.list[houseid].boxes = {{ Vector( 1002.6128540039, 11108.049804688, 57 ), Vector( 2592.3537597656, 12214.212890625, 948.96875 )},{ Vector( 1045.6201171875, 10190.637695313, 57.837905883789 ), Vector( 2070.173828125, 11073.383789063, 948.96887207031 )} }
	houses.list[houseid].bellpos = Vector( 2286.951171875, 11599.96875, 142.59632873535 )
	houses.list[houseid].panels = {}
	houses.list[houseid].panelpos = { Vector( 2594.03125, 11531.499023438, 190 ), Vector( 2581.96875, 11594.600585938, 190 ), Vector( 2077.96875, 11713.151367188, 130 ), Vector( 2090.03125, 11667.715820313, 130 ), }
	houses.list[houseid].panelangle = { Angle( 0, 90, 90 ), Angle( 0, 270, 90 ), Angle( 0, 270, 90 ), Angle( 0, 90, 90 ), }
	houses.list[houseid].textpos =   Vector( 2594.03125, 11531.499023438, 220 )
	houses.list[houseid].textangle = Angle(0,90,90)
	houses.list[houseid].owner = houses.list[houseid].owner or ""
	houses.list[houseid].ownername = houses.list[houseid].ownername or ""
	houses.list[houseid].friends = houses.list[houseid].friends or {}
	houses.list[houseid].friendsname = houses.list[houseid].friendsname or {}
	houses.list[houseid].doors = houses.list[houseid].doors or {}
	houses.list[houseid].props = houses.list[houseid].props or {}

	houseid = houseid + 1
	houses.list[houseid] = houses.list[houseid] or {} 
	houses.list[houseid].price = 133700
	houses.list[houseid].perma = false
	houses.list[houseid].name = "Old farm"
	houses.list[houseid].boxes = {{ Vector( 4079.4267578125, 10338.3046875, 58 ), Vector( 5279.0366210938, 11530.189453125, 948.96868896484 )}}
	houses.list[houseid].bellpos = Vector( 4584.1689453125, 10955.655273438, 175.52514648438 )
	houses.list[houseid].panels = {}
	houses.list[houseid].panelpos = { Vector( 4270.1689453125, 11116.038085938, 130 ), Vector( 4364.8637695313, 10964.231445313, 130 ), }
	houses.list[houseid].panelangle = { Angle( 0, 270, 90 ), Angle( 0, 180, 90 ), }
	houses.list[houseid].textpos =    Vector( 4270.1689453125, 11116.038085938, 180)
	houses.list[houseid].textangle = Angle(0,270,90)
	houses.list[houseid].owner = houses.list[houseid].owner or ""
	houses.list[houseid].ownername = houses.list[houseid].ownername or ""
	houses.list[houseid].friends = houses.list[houseid].friends or {}
	houses.list[houseid].friendsname = houses.list[houseid].friendsname or {}
	houses.list[houseid].doors = houses.list[houseid].doors or {}
	houses.list[houseid].props = houses.list[houseid].props or {}


	houseid = houseid + 1
	houses.list[houseid] = houses.list[houseid] or {} 
	houses.list[houseid].price = 13700
	houses.list[houseid].perma = false
	houses.list[houseid].name = "Poor man's refuge"
	houses.list[houseid].boxes = {{ Vector( -1119.1264648438, -8282.03125, 60 ), Vector( -848.74291992188, -8014.6870117188, 188.96875 )}}
	houses.list[houseid].bellpos = Vector( -1009.0796508789, -8178.96875, 181.55442810059 )
	houses.list[houseid].panels = {}
	houses.list[houseid].panelpos = { Vector( -914.14434814453, -8008.96875, 132 ), Vector( -958.6494140625, -8021.03125, 132 ), }
	houses.list[houseid].panelangle = { Angle( 0, 180, 90 ), Angle( 0, 360, 90 ), }
	houses.list[houseid].textpos =     Vector( -870.14434814453, -8008.96875, 172 )
	houses.list[houseid].textangle = Angle(0,180,90)
	houses.list[houseid].owner = houses.list[houseid].owner or ""
	houses.list[houseid].ownername = houses.list[houseid].ownername or ""
	houses.list[houseid].friends = houses.list[houseid].friends or {}
	houses.list[houseid].friendsname = houses.list[houseid].friendsname or {}
	houses.list[houseid].doors = houses.list[houseid].doors or {}
	houses.list[houseid].props = houses.list[houseid].props or {}


	houseid = houseid + 1
	houses.list[houseid] = houses.list[houseid] or {} 
	houses.list[houseid].price = 8800
	houses.list[houseid].perma = false
	houses.list[houseid].name = "Little paradise"
	houses.list[houseid].boxes = {{ Vector( -561, -8283, 60 ), Vector( -366, -8014, 188.96875 )}}
	houses.list[houseid].bellpos = Vector( -433.84, -8019.04, 151.59 )
	houses.list[houseid].panels = {}
	houses.list[houseid].panelpos = { Vector( -440.33474731445, -8021.03125, 132 ), Vector( -386.14727783203, -8008.96875, 132 ), }
	houses.list[houseid].panelangle = { Angle( 0, 360, 90 ), Angle( 0, 180, 90 ), }
	houses.list[houseid].textpos =   Vector( -370, -8008.96875, 172 )
	houses.list[houseid].textangle = Angle(0,180,90)
	houses.list[houseid].owner = houses.list[houseid].owner or ""
	houses.list[houseid].ownername = houses.list[houseid].ownername or ""
	houses.list[houseid].friends = houses.list[houseid].friends or {}
	houses.list[houseid].friendsname = houses.list[houseid].friendsname or {}
	houses.list[houseid].doors = houses.list[houseid].doors or {}
	houses.list[houseid].props = houses.list[houseid].props or {}


	houseid = houseid + 1
	houses.list[houseid] = houses.list[houseid] or {} 
	houses.list[houseid].price = 82000
	houses.list[houseid].perma = false
	houses.list[houseid].name = "The house of the lake"
	houses.list[houseid].boxes = {{ Vector( -6310.634765625, 14317.375976563, 179.60568237305 ), Vector( -5836.609375, 15111.291015625, 948.96875 )}}
	houses.list[houseid].bellpos = Vector( -6078.3979492188, 14759.96875, 339.47729492188 )
	houses.list[houseid].panels = {}
	houses.list[houseid].panelpos = { Vector( -6247.8403320313, 14437.96875, 310 ), Vector( -6186.8813476563, 14450.03125, 310 ), }
	houses.list[houseid].panelangle = { Angle( 0, 360, 90 ), Angle( 0, 180, 90 ), }
	houses.list[houseid].textpos =    Vector( -6247.8403320313, 14437.96875, 370 )
	houses.list[houseid].textangle = Angle(0,0,90)
	houses.list[houseid].owner = houses.list[houseid].owner or ""
	houses.list[houseid].ownername = houses.list[houseid].ownername or ""
	houses.list[houseid].friends = houses.list[houseid].friends or {}
	houses.list[houseid].friendsname = houses.list[houseid].friendsname or {}
	houses.list[houseid].doors = houses.list[houseid].doors or {}
	houses.list[houseid].props = houses.list[houseid].props or {}


	houses.BroadcastData()
	return
end


if (map == "rp_paralake_city_v3") then
	local houseid = 1
	houses.list[houseid] = houses.list[houseid] or {}
	houses.list[houseid].price = 80000
	houses.list[houseid].perma = false
	houses.list[houseid].name = "Cozy nest"
	houses.list[houseid].boxes = {{ Vector( 5668.7426757813, -7523.9853515625, 83.999984741211 ), Vector( 6313.0654296875, -6637.0083007813, 3455.96875 )}}
	houses.list[houseid].bellpos = Vector( 5900.03125, -7224.9516601563, 265.85250854492 )
	houses.list[houseid].panels = {}
	houses.list[houseid].panelpos = { Vector( 6178.03125, -7136.0610351563, 207.25184631348 ), Vector( 6165.96875, -7199.5986328125, 210.37350463867 ), }
	houses.list[houseid].panelangle = { Angle( 0, 90, 90 ), Angle( 0, 270, 90 ), }
	houses.list[houseid].textpos =   Vector( 6178.03125, -7136.0610351563, 280 )
	houses.list[houseid].textangle = Angle(0,90,90)
	houses.list[houseid].owner = houses.list[houseid].owner or ""
	houses.list[houseid].ownername = houses.list[houseid].ownername or ""
	houses.list[houseid].friends = houses.list[houseid].friends or {}
	houses.list[houseid].friendsname = houses.list[houseid].friendsname or {}
	houses.list[houseid].doors = houses.list[houseid].doors or {}
	houses.list[houseid].props = houses.list[houseid].props or {}



	houseid = houseid + 1
	houses.list[houseid] = houses.list[houseid] or {}
	houses.list[houseid].price = 80000
	houses.list[houseid].perma = false
	houses.list[houseid].name = "Cozy nest 2"
	houses.list[houseid].boxes = {{ Vector( 9902.865234375, -8848.4658203125, 97.927429199219 ), Vector( 10780.014648438, -7954.50390625, 3455.96875 )}}
	houses.list[houseid].bellpos = Vector( 10245.03125, -8483.6826171875, 302.56762695313 )
	houses.list[houseid].panels = {}
	houses.list[houseid].panelpos = { Vector( 10523.03125, -8387.291015625, 255 ), Vector( 10510.96875, -8450.869140625, 255 ), }
	houses.list[houseid].panelangle = { Angle( 0, 90, 90 ), Angle( 0, 270, 90 ), }
	houses.list[houseid].textpos = Vector( 10523.03125, -8387.291015625, 320 )
	houses.list[houseid].textangle = Angle(0,90,90)
	houses.list[houseid].owner = houses.list[houseid].owner or ""
	houses.list[houseid].ownername = houses.list[houseid].ownername or ""
	houses.list[houseid].friends = houses.list[houseid].friends or {}
	houses.list[houseid].friendsname = houses.list[houseid].friendsname or {}
	houses.list[houseid].doors = houses.list[houseid].doors or {}
	houses.list[houseid].props = houses.list[houseid].props or {}

	houseid = houseid + 1
	houses.list[houseid] = houses.list[houseid] or {}
	houses.list[houseid].price = 300000
	houses.list[houseid].perma = false
	houses.list[houseid].name = "Golden valley"
	houses.list[houseid].boxes = {{ Vector( 9908.353515625, 9467.17578125, 80.041244506836 ), Vector( 12359.448242188, 10442.484375, 3455.9685058594 )}}
	houses.list[houseid].bellpos = Vector( 11039.96875, 9899.0712890625, 207.80560302734 )
	houses.list[houseid].panels = {}
	houses.list[houseid].panelpos = { Vector( 11466.03125, 9602.017578125, 140 ), Vector( 11435.3984375, 9482.03125, 155 ), Vector( 10653.96875, 9964.3193359375, 155 ), Vector( 10681.956054688, 9933.96875, 155 ), }
	houses.list[houseid].panelangle = { Angle( 0, 90, 90 ), Angle( 0, 180, 90 ), Angle( 0, 270, 90 ), Angle( 0, 360, 90 ), }
	houses.list[houseid].textpos =   Vector( 10653.96875, 9800, 180 )
	houses.list[houseid].textangle = Angle(0,270,90)
	houses.list[houseid].owner = houses.list[houseid].owner or ""
	houses.list[houseid].ownername = houses.list[houseid].ownername or ""
	houses.list[houseid].friends = houses.list[houseid].friends or {}
	houses.list[houseid].friendsname = houses.list[houseid].friendsname or {}
	houses.list[houseid].doors = houses.list[houseid].doors or {}
	houses.list[houseid].props = houses.list[houseid].props or {}

	houseid = houseid + 1
	houses.list[houseid] = houses.list[houseid] or {}
	houses.list[houseid].price = 300000
	houses.list[houseid].perma = false
	houses.list[houseid].name = "The Right Honourable"
	houses.list[houseid].boxes = {{ Vector( 9899.3515625, 10429.881835938, 80.041259765625 ), Vector( 12341.612304688, 11705.368164063, 3455.9689941406 )}}
	houses.list[houseid].bellpos = Vector( 11039.96875, 11100.833007813, 209.93521118164 )
	houses.list[houseid].panels = {}
	houses.list[houseid].panelpos = { Vector( 11466.03125, 9602.017578125+1200, 140 ), Vector( 11435.3984375, 9482.03125+1195, 155 ), Vector( 10653.96875, 9964.3193359375+1200, 155 ), Vector( 10681.956054688, 9933.96875+1200, 155 ), }
	houses.list[houseid].panelangle = { Angle( 0, 90, 90 ), Angle( 0, 180, 90 ), Angle( 0, 270, 90 ), Angle( 0, 360, 90 ), }
	houses.list[houseid].textpos =   Vector( 10653.96875, 9800+1200, 180 )
	houses.list[houseid].textangle = Angle(0,270,90)
	houses.list[houseid].owner = houses.list[houseid].owner or ""
	houses.list[houseid].ownername = houses.list[houseid].ownername or ""
	houses.list[houseid].friends = houses.list[houseid].friends or {}
	houses.list[houseid].friendsname = houses.list[houseid].friendsname or {}
	houses.list[houseid].doors = houses.list[houseid].doors or {}
	houses.list[houseid].props = houses.list[houseid].props or {}


	houseid = houseid + 1
	houses.list[houseid] = houses.list[houseid] or {}
	houses.list[houseid].price = 300000
	houses.list[houseid].perma = false
	houses.list[houseid].name = "Park View"
	houses.list[houseid].boxes = {{ Vector( 9928.158203125, 11693.803710938, 68.915390014648 ), Vector( 12327.291015625, 12930.83203125, 3455.96875 )}}
	houses.list[houseid].bellpos = Vector( 11039.96875, 12370.483398438, 190.07926940918 )
	houses.list[houseid].panels = {}
	houses.list[houseid].panelpos = { Vector( 11466.03125, 9602.017578125+1200+1262, 140 ), Vector( 11435.3984375, 9482.03125+1195+1269, 155 ), Vector( 10653.96875, 9964.3193359375+1200+1262, 155 ), Vector( 10681.956054688, 9933.96875+1200+1262, 155 ), }
	houses.list[houseid].panelangle = { Angle( 0, 90, 90 ), Angle( 0, 180, 90 ), Angle( 0, 270, 90 ), Angle( 0, 360, 90 ), }
	houses.list[houseid].textpos =   Vector( 10653.96875, 9800+1200+1262, 180 )
	houses.list[houseid].textangle = Angle(0,270,90)
	houses.list[houseid].owner = houses.list[houseid].owner or ""
	houses.list[houseid].ownername = houses.list[houseid].ownername or ""
	houses.list[houseid].friends = houses.list[houseid].friends or {}
	houses.list[houseid].friendsname = houses.list[houseid].friendsname or {}
	houses.list[houseid].doors = houses.list[houseid].doors or {}
	houses.list[houseid].props = houses.list[houseid].props or {}


	houseid = houseid + 1
	houses.list[houseid] = houses.list[houseid] or {}
	houses.list[houseid].price = 120000
	houses.list[houseid].perma = false
	houses.list[houseid].name = "Good Neighbor"
	houses.list[houseid].boxes = {{ Vector( 8626.162109375, 9818.9560546875, 80.03125 ), Vector( 9353.3916015625, 10810.651367188, 3455.96875 )}}
	houses.list[houseid].bellpos = Vector( 8871.84375, 10389.887695313, 228.33377075195 )
	houses.list[houseid].panels = {}
	houses.list[houseid].panelpos = { Vector( 8925.96875, 10641.424804688, 173.01559448242 ), Vector( 8897.2861328125, 10565.96875, 173.19340515137 ), Vector( 8975.6064453125, 10090.03125, 173.65409851074 ), Vector( 8926.1533203125, 10077.96875, 166.64447021484 ), }
	houses.list[houseid].panelangle = { Angle( 0, 270, 90 ), Angle( 0, 360, 90 ), Angle( 0, 180, 90 ), Angle( 0, 360, 90 ), }
	houses.list[houseid].textpos =   Vector( 8925.96875, 10655, 220 )
	houses.list[houseid].textangle = Angle(0,270,90)
	houses.list[houseid].owner = houses.list[houseid].owner or ""
	houses.list[houseid].ownername = houses.list[houseid].ownername or ""
	houses.list[houseid].friends = houses.list[houseid].friends or {}
	houses.list[houseid].friendsname = houses.list[houseid].friendsname or {}
	houses.list[houseid].doors = houses.list[houseid].doors or {}
	houses.list[houseid].props = houses.list[houseid].props or {}

	houseid = houseid + 1
	houses.list[houseid] = houses.list[houseid] or {}
	houses.list[houseid].price = 120000
	houses.list[houseid].perma = false
	houses.list[houseid].name = "Breezehome"
	houses.list[houseid].boxes = {{ Vector( 7504.5595703125, 11619.341796875, 80.03125 ), Vector( 8165.4321289063, 12527.309570313, 3455.96875 )}}
	houses.list[houseid].bellpos = Vector( 7915.6977539063, 12005.653320313, 234.53407287598 )
	houses.list[houseid].panels = {}
	houses.list[houseid].panelpos = { Vector( 7890.03125, 11784.99609375, 180 ), Vector( 7919.7197265625, 11858.03125, 180 ), Vector( 7845.7084960938, 12333.96875, 180 ), Vector( 7904.9458007813, 12346.03125, 160.42372131348 ), }
	houses.list[houseid].panelangle = {  Angle( 0, 90, 90 ), Angle( 0, 180, 90 ), Angle( 0, 360, 90 ), Angle( 0, 180, 90 ), }
	houses.list[houseid].textpos =  Vector( 7890.03125, 11784.99609375, 220 )
	houses.list[houseid].textangle = Angle(0,90,90)
	houses.list[houseid].owner = houses.list[houseid].owner or ""
	houses.list[houseid].ownername = houses.list[houseid].ownername or ""
	houses.list[houseid].friends = houses.list[houseid].friends or {}
	houses.list[houseid].friendsname = houses.list[houseid].friendsname or {}
	houses.list[houseid].doors = houses.list[houseid].doors or {}
	houses.list[houseid].props = houses.list[houseid].props or {}

	houses.BroadcastData()
	return
end



if (map == "rp_evocity2_v5p") then

	local houseid = 1
	houses.list[houseid] = houses.list[houseid] or {}
	houses.list[houseid].price = 85000
	houses.list[houseid].perma = false
	houses.list[houseid].name = "Lady of the Lake"
	houses.list[houseid].boxes = {{ Vector( -385.58111572266, -11498.049804688, -2505.5124511719 ), Vector( 189.50274658203, -11207.09765625, 1679.96875 )}}
	houses.list[houseid].bellpos = Vector( -62.968742370605, -11354.043945313, -2392.3303222656 )
	houses.list[houseid].panels = {}
	houses.list[houseid].panelpos = { Vector( 195.03125, -11369.2109375, -2430 ), Vector( 165.59831237793, -11465.96875, -2433.9467773438 ), }
	houses.list[houseid].panelangle = { Angle( 0, 90, 90 ), Angle( 0, 180, 90 ), }
	houses.list[houseid].textpos =   Vector( 195.03125, -11420, -2350 )
	houses.list[houseid].textangle = Angle(0,90,90)
	houses.list[houseid].owner = houses.list[houseid].owner or ""
	houses.list[houseid].ownername = houses.list[houseid].ownername or ""
	houses.list[houseid].friends = houses.list[houseid].friends or {}
	houses.list[houseid].friendsname = houses.list[houseid].friendsname or {}
	houses.list[houseid].doors = houses.list[houseid].doors or {}
	houses.list[houseid].props = houses.list[houseid].props or {}



	houseid = houseid + 1
	houses.list[houseid] = houses.list[houseid] or {}
	houses.list[houseid].price = 80000
	houses.list[houseid].perma = false
	houses.list[houseid].name = "The fisherman"
	houses.list[houseid].boxes = {{ Vector( 1502.0808105469, -10170.1875, -2818.3913574219 ), Vector( 1998.1546630859, -9602.833984375, 1679.96875 )}}
	houses.list[houseid].bellpos = Vector( 1733.9460449219, -9875.03125, -2723.1164550781 )
	houses.list[houseid].panels = {}
	houses.list[houseid].panelpos = { Vector( 1642.7030029297, -10133.03125, -2745 ), Vector( 1543.03125, -10102.81640625, -2743.4953613245 ), }
	houses.list[houseid].panelangle = { Angle( 0, 360, 90 ), Angle( 0, 90, 90 ), }
	houses.list[houseid].textpos = Vector( 1642.7030029297, -10133.03125, -2650)
	houses.list[houseid].textangle = Angle(0,0,90)
	houses.list[houseid].owner = houses.list[houseid].owner or ""
	houses.list[houseid].ownername = houses.list[houseid].ownername or ""
	houses.list[houseid].friends = houses.list[houseid].friends or {}
	houses.list[houseid].friendsname = houses.list[houseid].friendsname or {}
	houses.list[houseid].doors = houses.list[houseid].doors or {}
	houses.list[houseid].props = houses.list[houseid].props or {}


	houseid = houseid + 1
	houses.list[houseid] = houses.list[houseid] or {}
	houses.list[houseid].price = 150000
	houses.list[houseid].perma = false
	houses.list[houseid].name = "The safe house"
	houses.list[houseid].boxes = {{ Vector( 7731.3305664063, 9897.990234375, -1824.0109863281 ), Vector( 9057.58203125, 11508.375, -708.03125 )}}
	houses.list[houseid].bellpos = Vector( 8299.44140625, 10232.96875, -1687.9205322266 )
	houses.list[houseid].panels = {}
	houses.list[houseid].panelpos = { Vector( 8224.287109375, 9998.96875, -1720.8111572266 ), Vector( 8347, 10060, -1720.97265625 ), }
	houses.list[houseid].panelangle = { Angle( 0, 360, 90 ), Angle( 0, 270, 90 ), }
	houses.list[houseid].textpos = Vector( 8223.6806640625, 9998.96875, -1645.9808349609 )
	houses.list[houseid].textangle = Angle(0,0,90)
	houses.list[houseid].owner = houses.list[houseid].owner or ""
	houses.list[houseid].ownername = houses.list[houseid].ownername or ""
	houses.list[houseid].friends = houses.list[houseid].friends or {}
	houses.list[houseid].friendsname = houses.list[houseid].friendsname or {}
	houses.list[houseid].doors = houses.list[houseid].doors or {}
	houses.list[houseid].props = houses.list[houseid].props or {}

	houseid = houseid + 1
	houses.list[houseid] = houses.list[houseid] or {}
	houses.list[houseid].price = 17000
	houses.list[houseid].perma = false
	houses.list[houseid].name = "Old farm"
	houses.list[houseid].boxes = {{ Vector( 7443.373046875, 6974.1772460938, -1824 ), Vector( 8554.3466796875, 7829.3642578125, -708.03125 )}}
	houses.list[houseid].bellpos = Vector( 7808.1694335938, 7274.4770507813, -1703.3029785156 )
	houses.list[houseid].panels = {}
	houses.list[houseid].panelpos = { Vector( 7494.1694335938, 7336.6245117188, -1756.8404541016 ), Vector( 7576.798828125, 7312.2319335938, -1754.2509765625 ), }
	houses.list[houseid].panelangle = { Angle( 0, 270, 90 ), Angle( 0, 180, 90 ), }
	houses.list[houseid].textpos = Vector( 7494.1694335938, 7298.72265625, -1687.0014648438 )
	houses.list[houseid].textangle = Angle(0,-90,90)
	houses.list[houseid].owner = houses.list[houseid].owner or ""
	houses.list[houseid].ownername = houses.list[houseid].ownername or ""
	houses.list[houseid].friends = houses.list[houseid].friends or {}
	houses.list[houseid].friendsname = houses.list[houseid].friendsname or {}
	houses.list[houseid].doors = houses.list[houseid].doors or {}
	houses.list[houseid].props = houses.list[houseid].props or {}


	houseid = houseid + 1
	houses.list[houseid] = houses.list[houseid] or {}
	houses.list[houseid].price = 170000
	houses.list[houseid].perma = false
	houses.list[houseid].name = "Good Neighbor"
	houses.list[houseid].boxes = {{ Vector( 5279.38671875, 7413.482421875, -1830 ), Vector( 5826.5825195313, 8561.369140625, -708.03125 )},{ Vector( 4271.4125976563, 6536.3022460938, -1825 ), Vector( 5328.8051757813, 8560.1767578125, -708.03118896484 )}}
	houses.list[houseid].bellpos = Vector( 5504.03125, 7911.6870117188, -1606.4987792969 )
	houses.list[houseid].panels = {}
	houses.list[houseid].panelpos = { Vector( 5818.03125, 7880.8725585938, -1694.2078857422 ), Vector( 5805.96875, 7933.5981445313, -1691.3172607422 ), Vector( 5301.96875, 7945.3950195313, -1758.2370605469 ), Vector( 5314.03125, 8015.9184570313, -1760.91015625 ), }
	houses.list[houseid].panelangle = { Angle( 0, 90, 90 ), Angle( 0, 270, 90 ), Angle( 0, 270, 90 ), Angle( 0, 90, 90 ), }
	houses.list[houseid].textpos = Vector( 5818.03125, 7732.4291992188, -1632.8381347656 )
	houses.list[houseid].textangle = Angle(0,90,90)
	houses.list[houseid].owner = houses.list[houseid].owner or ""
	houses.list[houseid].ownername = houses.list[houseid].ownername or ""
	houses.list[houseid].friends = houses.list[houseid].friends or {}
	houses.list[houseid].friendsname = houses.list[houseid].friendsname or {}
	houses.list[houseid].doors = houses.list[houseid].doors or {}
	houses.list[houseid].props = houses.list[houseid].props or {}

	houseid = houseid + 1
	houses.list[houseid] = houses.list[houseid] or {}
	houses.list[houseid].price = 220000
	houses.list[houseid].perma = false
	houses.list[houseid].name = "High view"
	houses.list[houseid].boxes = {{ Vector( 3612.2595214844, -2564.3732910156, 460 ), Vector( 4185.443359375, -1912.6867675781, 1685.96875 )},{ Vector( 3607.96875, -1925.4849853516, 460 ), Vector( 3931.8615722656, -1680.8900146484, 587.96875 )}}
	houses.list[houseid].bellpos = Vector( 4068.6838378906, -2103.96875, 558.73962402344 )
	houses.list[houseid].panels = {}
	houses.list[houseid].panelpos = { Vector( 4010.169921875, -1917.96875, 530 ), Vector( 4089.7312011719, -1930.03125, 530 ), }
	houses.list[houseid].panelangle = { Angle( 0, 180, 90 ), Angle( 0, 360, 90 ), }
	houses.list[houseid].textpos = Vector( 4010.169921875, -1917.96875, 570 )
	houses.list[houseid].textangle = Angle(0,180,90) 
	houses.list[houseid].owner = houses.list[houseid].owner or ""
	houses.list[houseid].ownername = houses.list[houseid].ownername or ""
	houses.list[houseid].friends = houses.list[houseid].friends or {}
	houses.list[houseid].friendsname = houses.list[houseid].friendsname or {}
	houses.list[houseid].doors = houses.list[houseid].doors or {}
	houses.list[houseid].props = houses.list[houseid].props or {}

	houseid = houseid + 1
	houses.list[houseid] = houses.list[houseid] or {}
	houses.list[houseid].price = 220000
	houses.list[houseid].perma = false
	houses.list[houseid].name = "Cpt Kebab"
	houses.list[houseid].boxes = {{ Vector( 4234.5844726563, 9624.78515625, -1895 ), Vector( 7225.0034179688, 11576.712890625, -708.03125 )}}
	houses.list[houseid].bellpos = Vector( 6159.96875, 10297.041992188, -1719.2484130859 )
	houses.list[houseid].panels = {}
	houses.list[houseid].panelpos = { Vector( 6200.521484375, 10150.03125, -1750.5856933594 ), Vector( 6350.744140625, 10654.03125, -1689.2561035156 ), Vector( 6170.03125, 10036.283203125, -1750 ), }
	houses.list[houseid].panelangle = { Angle( 0, 180, 90 ), Angle( 0, 180, 90 ), Angle( 0, 90, 90 ), }
	houses.list[houseid].textpos = Vector( 6170.03125, 10036.713867188, -1712.0450439453 )
	houses.list[houseid].textangle = Angle(0,90,90)
	houses.list[houseid].owner = houses.list[houseid].owner or ""
	houses.list[houseid].ownername = houses.list[houseid].ownername or ""
	houses.list[houseid].friends = houses.list[houseid].friends or {}
	houses.list[houseid].friendsname = houses.list[houseid].friendsname or {}
	houses.list[houseid].doors = houses.list[houseid].doors or {}
	houses.list[houseid].props = houses.list[houseid].props or {}
	houses.BroadcastData()
	return
end
if (map == "rp_florida") then


	local houseid = 1
	houses.list[houseid] = houses.list[houseid] or {}
	houses.list[houseid].price = 85000
	houses.list[houseid].perma = false
	houses.list[houseid].name = "Noisy apartment"
	houses.list[houseid].boxes = {{ Vector( 3463, -503.27639770508, 287 ), Vector( 4016.6452636719, -63.96875, 440 )}}
	houses.list[houseid].bellpos = Vector( 3595.96875, -210.51077270508, 399.42300415039 )
	houses.list[houseid].panels = {}
	houses.list[houseid].panelpos = { Vector( 3466.03125, -180.14698791504, 362 ), Vector( 3651.8845214844, -61.968753814697, 362 ), }
	houses.list[houseid].panelangle = { Angle( 0, 90, 90 ), Angle( 0, 180, 90 ), }
	houses.list[houseid].textpos =    Vector( 3651.8845214844, -61.968753814697, 400 )
	houses.list[houseid].textangle = Angle(0,180,90)
	houses.list[houseid].owner = houses.list[houseid].owner or ""
	houses.list[houseid].ownername = houses.list[houseid].ownername or ""
	houses.list[houseid].friends = houses.list[houseid].friends or {}
	houses.list[houseid].friendsname = houses.list[houseid].friendsname or {}
	houses.list[houseid].doors = houses.list[houseid].doors or {}
	houses.list[houseid].props = houses.list[houseid].props or {}
	

	houseid = houseid + 1
	houses.list[houseid] = houses.list[houseid] or {}
	houses.list[houseid].price = 85000
	houses.list[houseid].perma = false
	houses.list[houseid].name = "Noisy apartment 2"
	houses.list[houseid].boxes = {{ Vector( 3463, -503.27639770508, 287+160 ), Vector( 4016.6452636719, -63.96875, 440+160 )}}
	houses.list[houseid].bellpos = Vector( 3595.96875, -210.51077270508, 399.42300415039 )
	houses.list[houseid].panels = {}
	houses.list[houseid].panelpos = { Vector( 3466.03125, -180.14698791504, 362+160 ), Vector( 3651.8845214844, -61.968753814697, 362+160 ), }
	houses.list[houseid].panelangle = { Angle( 0, 90, 90 ), Angle( 0, 180, 90 ), }
	houses.list[houseid].textpos =   Vector( 3651.8845214844, -61.968753814697, 560 )
	houses.list[houseid].textangle = Angle(0,180,90)
	houses.list[houseid].owner = houses.list[houseid].owner or ""
	houses.list[houseid].ownername = houses.list[houseid].ownername or ""
	houses.list[houseid].friends = houses.list[houseid].friends or {}
	houses.list[houseid].friendsname = houses.list[houseid].friendsname or {}
	houses.list[houseid].doors = houses.list[houseid].doors or {}
	houses.list[houseid].props = houses.list[houseid].props or {}



	houseid = houseid + 1
	houses.list[houseid] = houses.list[houseid] or {}
	houses.list[houseid].price = 85000
	houses.list[houseid].perma = false
	houses.list[houseid].name = "Apartment 4"
	houses.list[houseid].boxes = {{ Vector( 3463, -503.27639770508, 287+160+160 ), Vector( 4016.6452636719, -63.96875, 440+160+160 )}}
	houses.list[houseid].bellpos = Vector( 3595.96875, -210.51077270508, 399.42300415039 )
	houses.list[houseid].panels = {}
	houses.list[houseid].panelpos = { Vector( 3466.03125, -180.14698791504, 362+160+160 ), Vector( 3651.8845214844, -61.968753814697, 362+160+160 ), }
	houses.list[houseid].panelangle = { Angle( 0, 90, 90 ), Angle( 0, 180, 90 ), }
	houses.list[houseid].textpos =   Vector( 3651.8845214844, -61.968753814697, 560+160 )
	houses.list[houseid].textangle = Angle(0,180,90)
	houses.list[houseid].owner = houses.list[houseid].owner or ""
	houses.list[houseid].ownername = houses.list[houseid].ownername or ""
	houses.list[houseid].friends = houses.list[houseid].friends or {}
	houses.list[houseid].friendsname = houses.list[houseid].friendsname or {}
	houses.list[houseid].doors = houses.list[houseid].doors or {}
	houses.list[houseid].props = houses.list[houseid].props or {}

	houseid = houseid + 1
	houses.list[houseid] = houses.list[houseid] or {}
	houses.list[houseid].price = 125000
	houses.list[houseid].perma = false
	houses.list[houseid].name = "Nice view"
	houses.list[houseid].boxes = {{ Vector( 3463, -503.27639770508, 287+160+160+160 ), Vector( 4016.6452636719, -63.96875, 440+160+160+160 )}}
	houses.list[houseid].bellpos = Vector( 3595.96875, -210.51077270508, 399.42300415039 )
	houses.list[houseid].panels = {}
	houses.list[houseid].panelpos = { Vector( 3466.03125, -180.14698791504, 362+160+160+160 ), Vector( 3651.8845214844, -61.968753814697, 362+160+160+160 ), }
	houses.list[houseid].panelangle = { Angle( 0, 90, 90 ), Angle( 0, 180, 90 ), }
	houses.list[houseid].textpos =   Vector( 3651.8845214844, -61.968753814697, 560+160+160 )
	houses.list[houseid].textangle = Angle(0,180,90)
	houses.list[houseid].owner = houses.list[houseid].owner or ""
	houses.list[houseid].ownername = houses.list[houseid].ownername or ""
	houses.list[houseid].friends = houses.list[houseid].friends or {}
	houses.list[houseid].friendsname = houses.list[houseid].friendsname or {}
	houses.list[houseid].doors = houses.list[houseid].doors or {}
	houses.list[houseid].props = houses.list[houseid].props or {}


	houseid = houseid + 1
	houses.list[houseid] = houses.list[houseid] or {}
	houses.list[houseid].price = 425000
	houses.list[houseid].perma = false
	houses.list[houseid].name = "Good neighbor"
	houses.list[houseid].boxes = {{ Vector( -12442.813476563, -2917.7873535156, 135 ), Vector( -11457.879882813, -1627.0983886719, 768 )}}
	houses.list[houseid].bellpos = Vector( -12111.96875, -1913.7729492188, 248.34957885742 )
	houses.list[houseid].panels = {}
	houses.list[houseid].panelpos = { Vector( -11858.03125, -1693.6306152344, 210 ), Vector( -11858.03125, -1832.0072021484, 210 ), Vector( -12427.96875, -2416.7849121094, 210 ), Vector( -12421.96875, -2262.9267578125, 210 ), }
	houses.list[houseid].panelangle = { Angle( 0, 270, 90 ), Angle( 0, 270, 90 ), Angle( 0, 90, 90 ), Angle( 0, 90, 90 ), }
	houses.list[houseid].textpos =   Vector( -11873.650390625, -1789.96875, 279.56057739258 )
	houses.list[houseid].textangle = Angle(0,180,90)
	houses.list[houseid].owner = houses.list[houseid].owner or ""
	houses.list[houseid].ownername = houses.list[houseid].ownername or ""
	houses.list[houseid].friends = houses.list[houseid].friends or {}
	houses.list[houseid].friendsname = houses.list[houseid].friendsname or {}
	houses.list[houseid].doors = houses.list[houseid].doors or {}
	houses.list[houseid].props = houses.list[houseid].props or {}


	houseid = houseid + 1
	houses.list[houseid] = houses.list[houseid] or {}
	houses.list[houseid].price = 725000
	houses.list[houseid].perma = false
	houses.list[houseid].name = "Fat neighbor"
	houses.list[houseid].boxes = {{ Vector( -13957.891601563, -1056.5142822266, 136.03123474121 ), Vector( -12649.401367188, 342.91220092773, 767.96875 )}}
	houses.list[houseid].bellpos = Vector( -13007.96875, -426.29522705078, 255.43135070801 )
	houses.list[houseid].panels = {}
	houses.list[houseid].panelpos = { Vector( -12813.96875, -320.71368408203, 210 ), Vector( -12826.03125, -280, 210 ), Vector( -13282.004882813, 53.96875, 210 ), Vector( -13330.03125, 84.813316345215, 210 ), }
	houses.list[houseid].panelangle = { Angle( 0, 90, 90 ), Angle( 0, 270, 90 ), Angle( 0, 360, 90 ), Angle( 0, 270, 90 ), }
	houses.list[houseid].textpos = Vector( -12813.96875, -320.71368408203, 260 )
	houses.list[houseid].textangle = Angle(0,90,90)
	houses.list[houseid].owner = houses.list[houseid].owner or ""
	houses.list[houseid].ownername = houses.list[houseid].ownername or ""
	houses.list[houseid].friends = houses.list[houseid].friends or {}
	houses.list[houseid].friendsname = houses.list[houseid].friendsname or {}
	houses.list[houseid].doors = houses.list[houseid].doors or {}
	houses.list[houseid].props = houses.list[houseid].props or {}


	houseid = houseid + 1
	houses.list[houseid] = houses.list[houseid] or {}
	houses.list[houseid].price = 250
	houses.list[houseid].perma = false
	houses.list[houseid].name = "Leakers HQ"
	houses.list[houseid].boxes = {{ Vector( 3987.4658203125, 6983.2182617188, 135 ), Vector( 4150.7426757813, 7214.21875, 767.96875 )}}
	houses.list[houseid].bellpos = Vector( 4108.9140625, 7092.05078125, 167.0054473877 )
	houses.list[houseid].panels = {}
	houses.list[houseid].panelpos = { Vector( 4155.2573242188, 7060, 210 ), }
	houses.list[houseid].panelangle = { Angle( 0, 90, 90 ), }
	houses.list[houseid].textpos = Vector( 4155.2573242188, 7036.71484375, 260 )
	houses.list[houseid].textangle = Angle(0,90,90)
	houses.list[houseid].owner = houses.list[houseid].owner or ""
	houses.list[houseid].ownername = houses.list[houseid].ownername or ""
	houses.list[houseid].friends = houses.list[houseid].friends or {}
	houses.list[houseid].friendsname = houses.list[houseid].friendsname or {}
	houses.list[houseid].doors = houses.list[houseid].doors or {}
	houses.list[houseid].props = houses.list[houseid].props or {}

	houseid = houseid + 1
	houses.list[houseid] = houses.list[houseid] or {}
	houses.list[houseid].price = 250
	houses.list[houseid].perma = false
	houses.list[houseid].name = "Hipsters"
	houses.list[houseid].boxes = {{ Vector( -86, -8736, 486 ), Vector( 487, -8216, 640 )}}
	houses.list[houseid].bellpos = Vector( 360.03125, -8292.2158203125, 604.87115478516 )
	houses.list[houseid].panels = {}
	houses.list[houseid].panelpos = { Vector( 379.43151855469, -8213.96875,560 ), Vector( 362.03125, -8302.7744140625, 560 ), }
	houses.list[houseid].panelangle = { Angle( 0, 180, 90 ), Angle( 0, 90, 90 ), }
	houses.list[houseid].textpos = Vector( 379.43151855469, -8213.96875,590 )
	houses.list[houseid].textangle = Angle(0,180,90)
	houses.list[houseid].owner = houses.list[houseid].owner or ""
	houses.list[houseid].ownername = houses.list[houseid].ownername or ""
	houses.list[houseid].friends = houses.list[houseid].friends or {}
	houses.list[houseid].friendsname = houses.list[houseid].friendsname or {}
	houses.list[houseid].doors = houses.list[houseid].doors or {}
	houses.list[houseid].props = houses.list[houseid].props or {}


	houses.BroadcastData()
	return
end






if (map == "rp_suncity_v2a") then


	local houseid = 1
	houses.list[houseid] = houses.list[houseid] or {}
	houses.list[houseid].price = 85000
	houses.list[houseid].perma = true
	houses.list[houseid].name = "Fairview"
	houses.list[houseid].boxes = {{ Vector( -12776.4609375, 1036.7584228516, 0 ), Vector( -10779.276367188, 2293.1257324219, 2047.96875 )}}
	houses.list[houseid].bellpos = Vector( -11407.240234375, 1783.96875, 121.35606384277 )
	houses.list[houseid].panels = {}
	houses.list[houseid].panelpos = { Vector( -11250, 1780, 97 ), Vector( -11362.186523438, 1781.96875, 97 ), Vector( -12098.03125, 1963.9979248047, 97 ), Vector( -12085.96875, 1898.3005371094, 97 ), Vector( -11861.385742188, 1597.96875, 97 ), Vector( -11686.462890625, 1482.03125, 97 ), }
	houses.list[houseid].panelangle = { Angle( 0.00022147534764372, 395.47875976563, 90 ), Angle( 0, 360, 90 ), Angle( 0, 270, 90 ), Angle( 0, 90, 90 ), Angle( 0, 360, 90 ), Angle( 0, 180, 90 ), }
	houses.list[houseid].textpos = Vector( -11261.96875, 1670.6472167969, 180 )
	houses.list[houseid].textangle = Angle( 0, 90, 90 )
	houses.list[houseid].owner = houses.list[houseid].owner or ""
	houses.list[houseid].ownername = houses.list[houseid].ownername or ""
	houses.list[houseid].friends = houses.list[houseid].friends or {}
	houses.list[houseid].friendsname = houses.list[houseid].friendsname or {}
	houses.list[houseid].doors = houses.list[houseid].doors or {}
	houses.list[houseid].props = houses.list[houseid].props or {}
	
	houseid = houseid + 1
	houses.list[houseid] = houses.list[houseid] or {}
	houses.list[houseid].price = 850000
	houses.list[houseid].perma = true
	houses.list[houseid].name = "Noisy apartment"
	houses.list[houseid].boxes = {{ Vector( 5331, 4570, 192 ), Vector( 5856, 5161, 505 )}}
	houses.list[houseid].bellpos = Vector( 5492.1987304688, 5032.03125, 449.75115966797 )
	houses.list[houseid].panels = {}
	houses.list[houseid].panelpos = { Vector( 5414.9516601563, 5034.03125, 425 ), Vector( 5333.96875, 5046.4477539063, 425 ) }
	houses.list[houseid].panelangle = { Angle( 0, 180, 90 ), Angle( 0, 270, 90 ), }
	houses.list[houseid].textpos = Vector( 5333.96875, 5046.4477539063, 460 ) 
	houses.list[houseid].textangle = Angle( 0, 270, 90 )
	houses.list[houseid].owner = houses.list[houseid].owner or ""
	houses.list[houseid].ownername = houses.list[houseid].ownername or ""
	houses.list[houseid].friends = houses.list[houseid].friends or {}
	houses.list[houseid].friendsname = houses.list[houseid].friendsname or {}
	houses.list[houseid].doors = houses.list[houseid].doors or {}
	houses.list[houseid].props = houses.list[houseid].props or {}

	houseid = houseid + 1
	houses.list[houseid] = houses.list[houseid] or {}
	houses.list[houseid].price = 830000
	houses.list[houseid].perma = true
	houses.list[houseid].name = "Hipster apartment"
	houses.list[houseid].boxes = {{ Vector( 5331, 4570, 192-160 ), Vector( 5856, 5161, 505-160 )}}
	houses.list[houseid].bellpos = Vector( 5492.1987304688, 5032.03125, 449.75115966797-160 )
	houses.list[houseid].panels = {}
	houses.list[houseid].panelpos = { Vector( 5414.9516601563, 5034.03125, 425-160 ), Vector( 5333.96875, 5046.4477539063, 425-160 ) }
	houses.list[houseid].panelangle = { Angle( 0, 180, 90 ), Angle( 0, 270, 90 ), }
	houses.list[houseid].textpos = Vector( 5333.96875, 5046.4477539063, 460-160 ) 
	houses.list[houseid].textangle = Angle( 0, 270, 90 )
	houses.list[houseid].owner = houses.list[houseid].owner or ""
	houses.list[houseid].ownername = houses.list[houseid].ownername or ""
	houses.list[houseid].friends = houses.list[houseid].friends or {}
	houses.list[houseid].friendsname = houses.list[houseid].friendsname or {}
	houses.list[houseid].doors = houses.list[houseid].doors or {}
	houses.list[houseid].props = houses.list[houseid].props or {}

	houseid = houseid + 1
	houses.list[houseid] = houses.list[houseid] or {}
	houses.list[houseid].price = 830000
	houses.list[houseid].perma = true
	houses.list[houseid].name = "Good Neighbor"
	houses.list[houseid].boxes = {{ Vector( -12775.483398438, 2315.7690429688, 0 ), Vector( -10733.060546875, 3181.865234375, 2047.96875 )}}
	houses.list[houseid].bellpos = Vector( -11272.03125, 2666.19921875, 128.25595092773 )
	houses.list[houseid].panels = {}
	houses.list[houseid].panelpos = { Vector( -11261.96875, 2628.5190429688, 95 ), Vector( -11274.03125, 2683.5568847656, 105 ), }
	houses.list[houseid].panelangle = { Angle( 0, 90, 90 ), Angle( 0, 270, 90 ), }
	houses.list[houseid].textpos = Vector( -11261.96875, 2628.4958496094, 141.92544555664 )
	houses.list[houseid].textangle = Angle( 0, 90, 90 )
	houses.list[houseid].owner = houses.list[houseid].owner or ""
	houses.list[houseid].ownername = houses.list[houseid].ownername or ""
	houses.list[houseid].friends = houses.list[houseid].friends or {}
	houses.list[houseid].friendsname = houses.list[houseid].friendsname or {}
	houses.list[houseid].doors = houses.list[houseid].doors or {}
	houses.list[houseid].props = houses.list[houseid].props or {}

	houseid = houseid + 1
	houses.list[houseid] = houses.list[houseid] or {}
	houses.list[houseid].price = 830000
	houses.list[houseid].perma = true
	houses.list[houseid].name = "Friendly Neighbor"
	houses.list[houseid].boxes = {{ Vector( -9464.4248046875, 1032.2844238281, -5 ), Vector( -7857.7514648438, 2777.9694824219, 2047.96875 )}}
	houses.list[houseid].bellpos = Vector( -8832.01171875, 2068.9958496094, 101.59617614746 )
	houses.list[houseid].panels = {}
	houses.list[houseid].panelpos = { Vector( -9053.94921875, 2204.7136230469, 75 ), Vector( -9074.01171875, 2078.8334960938, 75 ), Vector( -8370.5302734375, 2045.96875, 75 ), Vector( -8285.94921875, 2257.6103515625, 75 ), Vector( -8506.7939453125, 2066.03125, 75 ), }
	houses.list[houseid].panelangle = { Angle( 0, 90, 90 ), Angle( 0, 270, 90 ), Angle( 0, 360, 90 ), Angle( 0, 90, 90 ), Angle( 0, 180, 90 ), }
	houses.list[houseid].textpos = Vector( -9074.01171875, 2070.0236816406, 140 )
	houses.list[houseid].textangle = Angle( 0, 270, 90 )
	houses.list[houseid].owner = houses.list[houseid].owner or ""
	houses.list[houseid].ownername = houses.list[houseid].ownername or ""
	houses.list[houseid].friends = houses.list[houseid].friends or {}
	houses.list[houseid].friendsname = houses.list[houseid].friendsname or {}
	houses.list[houseid].doors = houses.list[houseid].doors or {}
	houses.list[houseid].props = houses.list[houseid].props or {}

	houseid = houseid + 1
	houses.list[houseid] = houses.list[houseid] or {}
	houses.list[houseid].price = 830000
	houses.list[houseid].perma = true
	houses.list[houseid].name = "Classy Apartment"
	houses.list[houseid].boxes = {{ Vector( 5287, 646, 270 ), Vector( 5719, 1175, 400 )}}
	houses.list[houseid].bellpos = Vector( 5461.7978515625, 856.03125, 380.34051513672 )
	houses.list[houseid].panels = {}
	houses.list[houseid].panelpos = { Vector( 5285.96875, 1031.2098388672, 345 ), Vector( 5306.03125, 991.86566162109, 345 ), }
	houses.list[houseid].panelangle = { Angle( 0, 270, 90 ), Angle( 0, 90, 90 ), }
	houses.list[houseid].textpos = Vector( 5285.96875, 1031.2098388672, 385 )
	houses.list[houseid].textangle = Angle( 0, 270, 90 )
	houses.list[houseid].owner = houses.list[houseid].owner or ""
	houses.list[houseid].ownername = houses.list[houseid].ownername or ""
	houses.list[houseid].friends = houses.list[houseid].friends or {}
	houses.list[houseid].friendsname = houses.list[houseid].friendsname or {}
	houses.list[houseid].doors = houses.list[houseid].doors or {}
	houses.list[houseid].props = houses.list[houseid].props or {}

	houses.BroadcastData()
	return
end
