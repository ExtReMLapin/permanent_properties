
TOOL.Category = "Perma properties helpers"
TOOL.Name = "#tool.houses_boxes.name"

if CLIENT then 
	language.Add( "tool.houses_boxes.0", "First LEFT-CLICK on the 8 corner of the CUBE you want to put the house, then add the bell with RIGHT click in the house, and then press RELOAD and you get the result in your clipboard" )
	language.Add( "tool.houses_boxes.name", "House zone creating helper" )
	language.Add( "tool.houses_boxes.desc", "Set-up zone," )
end


local tbldata = {}
local bellpos ;
local function formattext(str1, str2, str3)
	return "\thouses.list[houseid].boxes = {{ " .. str1 .. ", " .. str2 .."}}\n\thouses.list[houseid].bellpos = " .. str3 .. "\n"
end

function TOOL:LeftClick( tr )
	if SERVER then 
		table.insert(tbldata, 1, self:GetOwner():GetEyeTrace().HitPos)
		tbldata[9] = nil
	end
	return true
end

function TOOL:RightClick( tr )
	if SERVER then 
		bellpos = self:GetOwner():GetEyeTrace().HitPos
	end
	return true
end

function TOOL:Reload( tr )
	if SERVER then 
		if not bellpos then  self:GetOwner():ChatPrint("You forgot the bell, righ it where you want, in the house to place it") return end
		if #tbldata == 8 then
			local str3, str1, str2 = houses.findrightvector(bellpos, tbldata)
			local txt = formattext(str1, str2, str3)
			print(txt)
			net.Start("houses_clipboard")
			net.WriteString(txt)
			net.Send(self:GetOwner())

		else
			self:GetOwner():ChatPrint("You need more points for the house, you need 8")
		end
	end


	return true
end
