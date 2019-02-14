
TOOL.Category = "Perma properties helpers"
TOOL.Name = "#tool.houses_panels.name"
if CLIENT then 
	language.Add( "tool.houses_panels.name", "Panel creating helper" )
	language.Add( "tool.houses_panels.desc", "Helps you create panel" )
	language.Add( "tool.houses_panels.0", "Left Click to add panel, right Click to reset panel list, reload to save result in the clipboard" )
end


local strtotal1 = "{ "
local strtotal2 = "{ "

local function formattext(str1, str2)
	return "\thouses.list[houseid].panelpos = " .. str1 ..  "\n\thouses.list[houseid].panelangle = ".. str2
end


function TOOL:LeftClick( tr )
		local str1, str2 = houses.getezpanelpos(self:GetOwner())
		strtotal1 = strtotal1 .. str1 .. ", "
		strtotal2 = strtotal2 .. str2.. ", "
	return true

end

function TOOL:RightClick( tr )
		strtotal1 = "{ "
		strtotal2 = "{ "
	return true
end

function TOOL:Reload( tr )
	if SERVER then 
		strtotal2 = strtotal2 .. "}"
		strtotal1 = strtotal1 .. "}"
			net.Start("houses_clipboard")
			net.WriteString(formattext(strtotal1, strtotal2))
			net.Send(self:GetOwner())
		strtotal1 = "{ "
		strtotal2 = "{ "
	end
	return true
end