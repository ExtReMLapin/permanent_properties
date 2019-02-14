surface.CreateFont( "312dpermaletterboxshow",
                    {
                    font    = "default",
                    size    = 13,
                    weight  = 0,
                    antialias = true,
                    shadow = false
})
surface.CreateFont( "312dpermaletterboxshow2",
                    {
                    font    = "default",
                    size    = 10,
                    weight  = 0,
                    antialias = true,
                    shadow = false
})

surface.CreateFont( "312dpermaletterboxshow3",
                    {
                    font    = "default",
                    size    = 12,
                    weight  = 0,
                    antialias = true,
                    shadow = false
})

local function WordWrap(str, limit)
    limit = limit or 72
    local here = 1
    local buf = ""
    local t = {}
    str:gsub("(%s*)()(%S+)()",
    function(sp, st, word, fi)
        if fi-here > limit then
            --# Break the line
            here = st
            table.insert(t, buf)
            buf = word
        else
            buf = buf..sp..word
        end
    end)
    if(buf ~= "") then
        table.insert(t, buf)
    end
    local result = ""
    for k,v in pairs(t) do
      result = result..v.."\n"
    end
    return result
end


local softgrey = Color(200,200,200,255)
function mailboxes.showmail(panel, UID) 
	local mail = mailboxes.mails[UID]
	local mess = mail.message
	local x42, y42 = panel:GetPos()
	local t1 = CurTime()
	if not panel.up and not panel.moving then 
		hook.Add("Think", "fixeight1", function()
		local var = -(CurTime()-t1)
		if var < 0 then
			panel:SetPos(0, var*200)
		end
		panel.moving = true 
		end)
		timer.Simple(0.5, function() hook.Remove("Think", "fixeight1") panel:SetPos(0, -100) panel.up = true panel.moving = false; end  )
	end

	mess:gsub("\n", " ")
	if string.len(mess) < 260 then
		mess = WordWrap(mess,70)
	else
		mess = WordWrap(mess,100)
	end
	
	if not mail then return end;
	if not panel.basetext then 
		panel.basetext = vgui.Create( "DPanel", panel) 
		panel.basetext:SetPos(10, 240)
		panel.basetext:SetSize(480,120)
	end
	panel.basetext.Paint = function (self, w, h )
			draw.RoundedBox( 4, 0, 0, w, h, softgrey)
			draw.DrawText( "Author : " .. mail.sendername, "312dpermaletterboxshow", 10,10,Color(0,0,0,255), TEXT_ALIGN_LEFT )
			draw.DrawText( "Money sent  : $" .. mail.money, "312dpermaletterboxshow", 350,10,Color(0,0,0,255), TEXT_ALIGN_LEFT )
			if string.len(mess) < 260 then
				draw.DrawText( mess , "312dpermaletterboxshow3", 10,30,Color(0,0,0,255), TEXT_ALIGN_LEFT )
			else
				draw.DrawText( mess , "312dpermaletterboxshow2", 10,30,Color(0,0,0,255), TEXT_ALIGN_LEFT )
			end
	end
			if not panel.basetextbutton then 
				panel.basetextbutton = vgui.Create( "DButton", panel.basetext )
				panel.basetextbutton:SetPos( 410, 30 )
				panel.basetextbutton:SetSize( 60, 80 )
				panel.basetextbutton:SetText("" )

			end
			panel.basetextbutton.Paint =  function( self, w, h )
					local color = Color( 245, 245, 245 )
					if self:IsDown() then color = Color( 180, 180, 180 ) end
					draw.RoundedBox( 4, 0, 0, w, h, color)
					draw.SimpleText("OK", "Draw3D2DHUD2", 30,40,Color(0,0,0,255), TEXT_ALIGN_CENTER,TEXT_ALIGN_CENTER )
				end
			panel.basetextbutton.DoClick = function()
				if not mailboxes.mails[UID] then return end
				net.Start("permapro-openedletter")
				net.WriteString(UID)
				net.SendToServer()
				surface.PlaySound( "ui/buttonclick.wav" )
				mailboxes.mails[UID] = nil;
				local i = 0;
				for k, v in pairs(mailboxes.mails) do
					UID = k;
					i = i + 1
				end
					if i < 1 then 
						panel.basetextbutton.Paint = function() end
						panel.basetextbutton.DoClick = function() end
						panel.basetext.Paint = function() end
						local t = CurTime()
						if panel.up and not panel.moving then 
							hook.Add("Think", "fixeight1", 
								function() 
									local var = (CurTime()-t)
									if var > 0 then 
										panel:SetPos(0, -100+var*200) 
									end
									panel.moving = true 
								end)

							timer.Simple(0.5, 
								function()
									 hook.Remove("Think", "fixeight1") 
									 panel:SetPos(0, 0) 
									 panel.up = false 
									 panel.moving = false; 
							 end  )
						end
					

					else
						mailboxes.showmail(panel, UID)
					end
			end
end
