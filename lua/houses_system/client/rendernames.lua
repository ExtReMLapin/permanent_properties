include( "3d2dvgui.lua" )

-- should give 20% perf boost
local surface = surface;
local LocalPlayer = LocalPlayer;
local net = net;
local draw = draw;
local util = util;
local util_PixelVisible = util.PixelVisible;
local color_w = Color(0,0,0,255)

local factor = 1
if houses.lang == "RU" then -- mother russia is too big for us :(
	factor = 0.91
end

surface.CreateFont( "DrawHouseName", {
	font = "default", -- Use the font-name which is shown to you by your operating system Font Viewer, not the file name
	size = 128*factor,
	weight = 10,
	blursize = 0,
	scanlines = 0,
	antialias = true,
	underline = false,
	italic = false,
	strikeout = false,
	symbol = false,
	rotary = false,
	shadow = false,
	additive = false,
	outline = false,
} )

surface.CreateFont( "Draw3D2DHUD", {
	font = "default", -- Use the font-name which is shown to you by your operating system Font Viewer, not the file name
	size = 12*factor,
	weight = 10,
	blursize = 0,
	scanlines = 0,
	antialias = true,
	underline = false,
	italic = false,
	strikeout = false,
	symbol = false,
	rotary = false,
	shadow = false,
	additive = false,
	outline = false,
} )

surface.CreateFont( "Draw3D2DHUDtimeleft", {
	font = "default", -- Use the font-name which is shown to you by your operating system Font Viewer, not the file name
	size = 30*factor,
	weight = 10,
	blursize = 0,
	scanlines = 0,
	antialias = true,
	underline = false,
	italic = false,
	strikeout = false,
	symbol = false,
	rotary = false,
	shadow = false,
	additive = false,
	outline = false,
} )

surface.CreateFont( "Draw3D2DHUD2", {
	font = "default", -- Use the font-name which is shown to you by your operating system Font Viewer, not the file name
	size = 25,
	weight = 10,
	blursize = 0,
	scanlines = 0,
	antialias = true,
	underline = false,
	italic = false,
	strikeout = false,
	symbol = false,
	rotary = false,
	shadow = false,
	additive = false,
	outline = false,
} )



hook.Add( "PostDrawOpaqueRenderables", "housesnamerender3d", function()
	if not (#houses.list > 0) then return end
	for k, v in pairs(houses.list) do 
		local dist = (LocalPlayer():GetPos()+Vector(0,0,90)):Distance(v.textpos)
		if dist > 700 then continue end
		local color = Color(255,255,255,math.Remap(dist,600,700,255,0))
		cam.Start3D2D( v.textpos, v.textangle, 0.1 )
			draw.SimpleText( v.name, "DrawHouseName", 0, 0, color, TEXT_ALIGN_LEFT)
			if v.owner == "" then
				draw.SimpleText( "$ " .. v.price, "DrawHouseName", 0, 100, color, TEXT_ALIGN_LEFT)
			else
				draw.SimpleText( v.ownername, "DrawHouseName", 0, 100, color, TEXT_ALIGN_LEFT)
			end
		cam.End3D2D()
	end
end )


local color_white = Color(255,255,255)
local belltx = Material("houses/bell.png")
local visatx = Material("houses/visa.png")
local undotx = Material("houses/undo.png")
local nopetx = Material("houses/nope.png")
local locktx = Material("houses/lock.png")
local unlocktx = Material("houses/unlock.png")
local grouptx = Material("houses/group.png")
local savetx = Material("houses/floppy.png")
local givetotx = Material("houses/givekeys.png")
local sellf = Material("houses/sellf.png")
local mailp = Material("houses/mail.png")


hook.Add("UpdatedHouseList", "CreatePanel", function()
	vgui.Reset3D2DDerma() -- prevent from recreating multiple panel
	for k, v in pairs(houses.list) do
		v.panelsdetectors = v.panelsdetectors or {}
		if v.timeleft then
			v.selltime = os.time() + v.timeleft
		end
		for k2, v2 in pairs(v.panelpos) do
			 v.panelsdetectors[k2] = v.panelsdetectors[k2] or {}
			if v.panels[k2] then 
				for i, j in pairs(v.panels[k2]:GetChildren()) do j:Remove() end
				v.panels[k2]:Remove( ) 
			end
			v.panels[k2] = vgui.Create( "DPanel")
			v.panels[k2]:SetPaintedManually( true )-- important (very)
			v.panels[k2]:SetPos( 0, 0 )
			v.panels[k2]:ParentToHUD()
			v.panels[k2]:SetSize( 500, 400 )
			v.panels[k2].Paint = function (self, w, h )

				draw.RoundedBox( 4, 0, 0, w, h, houses.rgbpanel)

				draw.RoundedBox( 4, 0, 0, 125, 25, (Color(150,150,150,155)))
				draw.SimpleText("Permanent Properties OS", "Draw3D2DHUD", 5,5,color_w, TEXT_ALIGN_LEFT )

				surface.SetDrawColor(150,150,150,255)
				if v.selltime and v.owner != "" and v.perma == false then 
					surface.DrawRect( 0, h-40, w, 40 )
					local mth = (v.selltime - os.time())/86400
					local timetodraw;
					if mth > 0 then 
						timetodraw = string.format(houses.rentalagreementmessage,mth)
					else
						timetodraw = houses.rentalagreementmessagedead
					end
					draw.SimpleText(timetodraw, "Draw3D2DHUDtimeleft", 250,360,color_w, TEXT_ALIGN_CENTER )
				end
			

			end
			v.isFriend = table.HasValue(v.friends, LocalPlayer():SteamID())
			v.panelsdetectors[k2].visi1 = v.panelsdetectors[k2].visi1 or util.GetPixelVisibleHandle()
			v.panelsdetectors[k2].visi2 = v.panelsdetectors[k2].visi2 or util.GetPixelVisibleHandle()
			v.panelsdetectors[k2].visi3 = v.panelsdetectors[k2].visi3 or util.GetPixelVisibleHandle()
			v.panelsdetectors[k2].visi4 = v.panelsdetectors[k2].visi4 or util.GetPixelVisibleHandle()
			v.panelsdetectors[k2].visi5 = v.panelsdetectors[k2].visi5 or util.GetPixelVisibleHandle()




			local DButton1 = vgui.Create( "DButton", v.panels[k2] )
			DButton1:SetPos( 10, 40 )
			DButton1:SetText( "" )
			DButton1:SetSize( 80, 80 )
			DButton1.DoClick = function()
				net.Start("houses_command")
				net.WriteUInt(k, 7)
				net.WriteUInt(0,4)
				net.SendToServer()

			end
			DButton1.Paint =  function( self, w, h )
				local color = Color( 220, 220, 220 )
				if self:IsDown() then color = Color( 180, 180, 180 ) end
				draw.RoundedBox( 4, 0, 0, w, h, color)
				surface.SetDrawColor( color_white)
				surface.SetMaterial(belltx)
				surface.DrawTexturedRect(8,4,64,64)
				draw.SimpleText(houses.ringbell, "Draw3D2DHUD", 40,66,color_w, TEXT_ALIGN_CENTER )
			end

			local DButton2 = vgui.Create( "DButton", v.panels[k2] )
			DButton2:SetPos( 110, 40 )
			DButton2:SetSize( 80, 80 )
			DButton2:SetText( ""  )
			DButton2.DoClick = function()
				net.Start("houses_command")
				net.WriteUInt(k, 7)
				net.WriteUInt(1,4)
				net.SendToServer()
				surface.PlaySound( "ui/buttonclick.wav" )
			end
			DButton2.Paint =  function( self, w, h )
				local color = Color( 220, 220, 220 )
				if self:IsDown() then color = Color( 180, 180, 180 ) end
				draw.RoundedBox( 4, 0, 0, w, h, color)
				surface.SetDrawColor( color_white)
				surface.SetMaterial(visatx)
				surface.DrawTexturedRect(8,4,64,64)
				if self.m_bDisabled then 
					surface.SetMaterial(nopetx)
					surface.DrawTexturedRect(16,16,48,48)
				end
				if v.perma == false then 
					draw.SimpleText(string.format(houses.rentfor,houses.BuyhouseforHowmanydays) , "Draw3D2DHUD", 40,66,color_w, TEXT_ALIGN_CENTER )
				else
					draw.SimpleText(houses.buyhouse, "Draw3D2DHUD", 40,66,color_w, TEXT_ALIGN_CENTER )
				end
			end
			
			local DButton3 = vgui.Create( "DButton", v.panels[k2] )
			DButton3:SetPos( 210, 40 )
			DButton3:SetSize( 80, 80 )
			DButton3:SetText( ""  )
			DButton3.DoClick = function()
				houses.opensellmenu(k)
				surface.PlaySound( "ui/buttonclick.wav" )
			end
			DButton3.Paint =  function( self, w, h )
				local color = Color( 220, 220, 220 )
				if self:IsDown() then color = Color( 180, 180, 180 ) end
				draw.RoundedBox( 4, 0, 0, w, h, color)
				surface.SetDrawColor( color_white)
				surface.SetMaterial(undotx)
				surface.DrawTexturedRect(8,4,64,64)
				if self.m_bDisabled then 
					surface.SetMaterial(nopetx)
					surface.DrawTexturedRect(16,16,48,48)
				end
				draw.SimpleText(houses.sellhouse, "Draw3D2DHUD", 40,66,color_w, TEXT_ALIGN_CENTER )
			end

			local DButton4 = vgui.Create( "DButton", v.panels[k2] )
			DButton4:SetPos( 310, 40 )
			DButton4:SetSize( 80, 80 )
			DButton4:SetText( ""  )
			DButton4.DoClick = function()
				net.Start("houses_command")
				net.WriteUInt(k, 7)
				net.WriteUInt(2,4)
				net.SendToServer()
				surface.PlaySound( "ui/buttonclick.wav" )
			end
			DButton4.Paint =  function( self, w, h )
				local color = Color( 220, 220, 220 )
				if self:IsDown() then color = Color( 180, 180, 180 ) end
				draw.RoundedBox( 4, 0, 0, w, h, color)
				surface.SetDrawColor( color_white)
				surface.SetMaterial(locktx)
				surface.DrawTexturedRect(8,4,64,64)
				if self.m_bDisabled then 
					surface.SetMaterial(nopetx)
					surface.DrawTexturedRect(16,16,48,48)
				end
				draw.SimpleText(houses.lockalldors, "Draw3D2DHUD", 40,66,color_w, TEXT_ALIGN_CENTER )
			end


			local DButton5 = vgui.Create( "DButton", v.panels[k2] )
			DButton5:SetPos( 410, 40 )
			DButton5:SetSize( 80, 80 )
			DButton5:SetText( ""  )
			DButton5.DoClick = function()
				net.Start("houses_command")
				net.WriteUInt(k, 7)
				net.WriteUInt(3,4)
				net.SendToServer()
				surface.PlaySound( "ui/buttonclick.wav" )
			end
			DButton5.Paint =  function( self, w, h )
				local color = Color( 220, 220, 220 )
				if self:IsDown() then color = Color( 180, 180, 180 ) end
				draw.RoundedBox( 4, 0, 0, w, h, color)
				surface.SetDrawColor( color_white)
				surface.SetMaterial(unlocktx)
				surface.DrawTexturedRect(8,4,64,64)
				if self.m_bDisabled then 
					surface.SetMaterial(nopetx)
					surface.DrawTexturedRect(16,16,48,48)
				end
				draw.SimpleText(houses.unlockalldors, "Draw3D2DHUD", 40,66,color_w, TEXT_ALIGN_CENTER )
			end

			local DButton6 = vgui.Create( "DButton", v.panels[k2] )
			DButton6:SetPos( 10, 140 )
			DButton6:SetSize( 80, 80 )
			DButton6:SetText( ""  )
			DButton6.DoClick = function()
				surface.PlaySound( "ui/buttonclick.wav" )
				houses.createbuddiespanel(k)
			end
			DButton6.Paint =  function( self, w, h )
				local color = Color( 220, 220, 220 )
				if self:IsDown() then color = Color( 180, 180, 180 ) end
				draw.RoundedBox( 4, 0, 0, w, h, color)
				surface.SetDrawColor( color_white)
				surface.SetMaterial(grouptx)
				surface.DrawTexturedRect(8,4,64,64)
				if self.m_bDisabled then 
					surface.SetMaterial(nopetx)
					surface.DrawTexturedRect(16,16,48,48)
				end
				draw.SimpleText(houses.managebuddies, "Draw3D2DHUD", 40,66,color_w, TEXT_ALIGN_CENTER )
			end

			local DButton7 = vgui.Create( "DButton", v.panels[k2] )
			DButton7:SetPos( 110, 140 )
			DButton7:SetSize( 80, 80 )
			DButton7:SetText( ""  )
			DButton7.DoClick = function()
				net.Start("houses_command")
				net.WriteUInt(k, 7)
				net.WriteUInt(4,4)
				net.SendToServer()
				surface.PlaySound( "ui/buttonclick.wav" )
			end
			DButton7.Paint =  function( self, w, h )
				local color = Color( 220, 220, 220 )
				if self:IsDown() then color = Color( 180, 180, 180 ) end
				draw.RoundedBox( 4, 0, 0, w, h, color)
				surface.SetDrawColor( color_white)
				surface.SetMaterial(savetx)
				surface.DrawTexturedRect(8,4,64,64)
				if self.m_bDisabled then 
					surface.SetMaterial(nopetx)
					surface.DrawTexturedRect(16,16,48,48)
				end
				draw.SimpleText(houses.saveprops, "Draw3D2DHUD", 40,66,color_w, TEXT_ALIGN_CENTER )
			end
			
			
			local DButton8 = vgui.Create( "DButton", v.panels[k2] )
			DButton8:SetPos( 210, 140 )
			DButton8:SetSize( 80, 80 )
			DButton8:SetText( ""  )
			DButton8.DoClick = function()

				houses.opentransferrightsmenu(k)
				surface.PlaySound( "ui/buttonclick.wav" )
			end
			DButton8.Paint =  function( self, w, h )
				local color = Color( 220, 220, 220 )
				if self:IsDown() then color = Color( 180, 180, 180 ) end
				draw.RoundedBox( 4, 0, 0, w, h, color)
				surface.SetDrawColor( color_white)
				surface.SetMaterial(givetotx)
				surface.DrawTexturedRect(8,4,64,64)
				if self.m_bDisabled then 
					surface.SetMaterial(nopetx)
					surface.DrawTexturedRect(16,16,48,48)
				end
				draw.SimpleText(houses.transferrights, "Draw3D2DHUD", 40,66,color_w, TEXT_ALIGN_CENTER )
			end

			local DButton9 = vgui.Create( "DButton", v.panels[k2] )
			DButton9:SetPos( 310, 140 )
			DButton9:SetSize( 80, 80 )
			DButton9:SetText( ""  )
			DButton9.DoClick = function()
				net.Start("houses_command")
				net.WriteUInt(k, 7)
				net.WriteUInt(5,4)
				net.SendToServer()
				surface.PlaySound( "ui/buttonclick.wav" )
			end
			DButton9.Paint =  function( self, w, h )
				local color = Color( 220, 220, 220 )
				if self:IsDown() then color = Color( 180, 180, 180 ) end
				draw.RoundedBox( 4, 0, 0, w, h, color)
				surface.SetDrawColor( color_white)
				surface.SetMaterial(sellf)
				surface.DrawTexturedRect(8,4,64,64)
				if self.m_bDisabled then 
					surface.SetMaterial(nopetx)
					surface.DrawTexturedRect(16,16,48,48)
				end
				draw.SimpleText(houses.sellhouse .. "(Force)", "Draw3D2DHUD", 40,66,color_w, TEXT_ALIGN_CENTER )
			end


			local DButton10 = vgui.Create( "DButton", v.panels[k2] )
			DButton10:SetPos( 410, 140 )
			DButton10:SetSize( 80, 80 )
			DButton10:SetText( ""  )
			DButton10.DoClick = function()
				local UID;
				for k, v in pairs(mailboxes.mails) do
					UID = k;
				end
				if UID then 
					mailboxes.showmail(v.panels[k2], UID)
					surface.PlaySound( "ui/buttonclick.wav" )
				end
			end
			DButton10.Paint =  function( self, w, h )
				local color = Color( 220, 220, 220 )
				if self:IsDown() then color = Color( 180, 180, 180 ) end
				draw.RoundedBox( 4, 0, 0, w, h, color)
				surface.SetDrawColor( color_white)
				surface.SetMaterial(mailp)
				surface.DrawTexturedRect(8,4,64,64)
				if self.m_bDisabled then 
					surface.SetMaterial(nopetx)
					surface.DrawTexturedRect(16,16,48,48)
				end
				draw.SimpleText("Mails", "Draw3D2DHUD", 40,66,color_w, TEXT_ALIGN_CENTER )
				local k42 = 0;
				for k, v in pairs(mailboxes.mails) do
					k42 = k42 +1;
				end
				if not DButton10.m_bDisabled then draw.SimpleText(tostring(k42), "Draw3D2DHUD2", 40,35,color_w, TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER ) end
			end

			--v.panels[k2].Think = function()
				DButton2.m_bDisabled = (v.owner != "")
				DButton3.m_bDisabled = (v.owner != LocalPlayer():SteamID())
				DButton4.m_bDisabled = !(v.owner == LocalPlayer():SteamID() or v.isFriend)
				DButton5.m_bDisabled = !(v.owner == LocalPlayer():SteamID() or v.isFriend)
				DButton6.m_bDisabled = DButton3.m_bDisabled
				DButton7.m_bDisabled = DButton3.m_bDisabled
				DButton8.m_bDisabled = DButton3.m_bDisabled
				DButton9.m_bDisabled = (!(LocalPlayer():IsAdmin()) or v.owner == "")
				DButton10.m_bDisabled = DButton4.m_bDisabled
				if v.perma == false then 
					DButton3.m_bDisabled = true
				end
			--end


			hook.Add( "PostDrawTranslucentRenderables", "DrawSample3D2DFrame[" .. tostring(k) .. "][" .. tostring(k2) .. "]", function()
				local maxdist = 1000;
				if LocalPlayer():GetPos():Distance(v.panelpos[k2]) > maxdist then return end
				local pos1 = v.panelpos[k2] -- top left
				local pos2 = v.panelpos[k2] + v.panelangle[k2]:Right() *19 + v.panelangle[k2]:Forward() *25 -- center of panel
				local pos3 = v.panelpos[k2] + v.panelangle[k2]:Right() *40 -- bottom left
				local pos4 = v.panelpos[k2] + v.panelangle[k2]:Forward() *50 -- top right
				local pos5 = v.panelpos[k2] + v.panelangle[k2]:Right() *40 + v.panelangle[k2]:Forward() *50 -- bottom left
				local score = 0;

				score = score + util_PixelVisible(pos1, 9, v.panelsdetectors[k2].visi1)
				score = score + util_PixelVisible(pos2, 9, v.panelsdetectors[k2].visi2)
				score = score + util_PixelVisible(pos3, 9, v.panelsdetectors[k2].visi3)
				score = score + util_PixelVisible(pos4, 9, v.panelsdetectors[k2].visi4)
				score = score + util_PixelVisible(pos5, 9, v.panelsdetectors[k2].visi5)

				if score < 0.5  then 
					v.panels[k2].shouldthink = false 
					return 
				end
				v.panels[k2].shouldthink = true
				vgui.Start3D2D( v.panelpos[k2], v.panelangle[k2], 0.1 )
						v.panels[k2]:Paint3D2D()
				vgui.End3D2D()
				
			end )
		end
	end
end)
