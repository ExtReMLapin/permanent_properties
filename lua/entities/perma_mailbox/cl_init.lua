include("shared.lua")

surface.CreateFont( "3d2dpermaletterbox",
                    {
                    font    = "default",
                    size    = 85,
                    weight  = 0,
                    antialias = true,
                    shadow = false
})

local color_white = Color(255,255,255,255)
local color_greyblue = Color(155,155,255,255)
local color_red = Color(200,50,50,255)
function ENT:Draw()
	self:DrawModel();
    local Pos = self:GetPos()
    local Ang = self:GetAngles()
    Ang:RotateAroundAxis(Ang:Up(), 90)
    Ang:RotateAroundAxis(Ang:Forward(), 60)
	cam.Start3D2D(Pos + Ang:Up() * (30+(math.cos(SysTime()*2)/4)) + Ang:Right()*-(40+(math.cos(SysTime()*2)/4)), Ang ,0.2/3) //~1710
		
		if self:GetEnabled() then
			draw.RoundedBox(4,-140,0,280,100, color_greyblue)
			draw.SimpleText( "Post box", "3d2dpermaletterbox", 0, 0, color_white, TEXT_ALIGN_CENTER, TEXT_ALIGN_TOP ) 
		else
			draw.RoundedBox(4,-140,0,280,100, color_red)
			draw.SimpleText( "Disabled", "3d2dpermaletterbox", 0, 0, color_white, TEXT_ALIGN_CENTER, TEXT_ALIGN_TOP ) 
		end
	cam.End3D2D()
end
