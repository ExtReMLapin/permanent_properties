local metavector = FindMetaTable( "Vector" )
local metaangle = FindMetaTable( "Angle" )

function metavector:ToString(round)
	local str;
	if round then
		str = "Vector( " .. math.floor( self.x * 100 ) / 100 .. ", " .. math.floor( self.y * 100 ) / 100 .. ", " .. math.floor( self.z * 100 ) / 100 .. " )"
	else
		str = "Vector( " .. self.x  .. ", " .. self.y .. ", " .. self.z  .. " )"
	end
	return str
end

function metaangle:ToString(round)
	local str;
	if round then
		str = "Angle( " .. math.floor( self.p * 100 ) / 100 .. ", " .. math.floor( self.y * 100 ) / 100 .. ", " .. math.floor( self.r * 100 ) / 100 .. " )"
	else
		str = "Angle( " .. self.p  .. ", " .. self.y .. ", " .. self.r  .. " )"
	end
	return str
end

function houses.getezpanelpos(ply)
	local trace = ply:GetEyeTrace()
	local ang = trace.HitNormal:Angle()
	local pos = trace.HitPos + ang:Forward() * 2
	local angfixed = ang + Angle(0,90,90)
	local str1 = pos:ToString()
	local str2 = angfixed:ToString()

	return str1, str2
end

function houses.findrightvector(target, tblpts)
	for k, v in pairs(tblpts) do
		for k2, v2 in pairs(tblpts) do
			if target:WithinAABox(v, v2) then
				return target:ToString(), v:ToString(), v2:ToString()
			end
		end
	end
	Error("Can't find good vector for this house, did you really place the bell inside the house ? and the box you're tring to get is outside and bigger than the house ?")
end



function houses.daytosaletotimestamp(days)
	return os.time() + (3600 * 24 * days)
end
