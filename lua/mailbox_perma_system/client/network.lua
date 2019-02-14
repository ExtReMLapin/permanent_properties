surface.CreateFont( "2dpermaletterbox",
                    {
                    font    = "default",
                    size    = 35,
                    weight  = 0,
                    antialias = true,
                    shadow = false
})

local function writeletter()
	local ssteamid;
	local Frame = vgui.Create( "DFrame" )
			Frame:SetPos( ScrW()/2-500, ScrH()/2-350 )
			Frame:SetSize( 1000, 530 )
			Frame:SetTitle( "Send a letter" )
			Frame:SetVisible( true )
			Frame:SetDraggable( true )
			Frame:ShowCloseButton( true )
			Frame:MakePopup()
			local DLabel = vgui.Create( "DLabel", Frame )
			DLabel:SetPos( 930, 410 )
			DLabel:SetMouseInputEnabled( true )
			DLabel:SetKeyboardInputEnabled( true )
			DLabel:SetTall( 70 )
			DLabel:SetWide(100)
			local TextEntry = vgui.Create( "DTextEntry", Frame )
				TextEntry:SetPos( 10, 30 )
				TextEntry:SetWrap(true)
				TextEntry:SetSize( 1000-20, 400 )
				TextEntry:SetMultiline( true )
				TextEntry:SetFont( "2dpermaletterbox" )
				TextEntry:SetText("Type your message here")
				DLabel:SetText( string.len(texte or "") .. "/512" )
				TextEntry:SetUpdateOnType( true )
				TextEntry.m_bLoseFocusOnClickAway = false
				TextEntry.OnChange = function()
				if string.len(TextEntry:GetValue()) > 512 then TextEntry:SetText(string.Left(TextEntry:GetValue(), 512)) end
				local text = TextEntry:GetValue()
				local textl = string.len(text)
					DLabel:SetText(  textl .. "/512" )
				end
			local DermaNumSlider = vgui.Create( "DNumSlider", Frame )
				DermaNumSlider:SetPos( 20, 415 )
				DermaNumSlider:SetSize( 300, 60 )
				DermaNumSlider:SetText( "Money to send" )
				DermaNumSlider:SetMin( 0 )
				DermaNumSlider:SetMax( math.Min(50000,LocalPlayer():getDarkRPVar("money")/5) )
				DermaNumSlider:SetDecimals( 0 )
				DermaNumSlider:SetValue( 0 )
			local DermaCheckbox = vgui.Create( "DCheckBoxLabel" , Frame)
					DermaCheckbox:SetPos( 760, 438 )
					DermaCheckbox:SetText( Format("Anonymous letter (+%i$)",mailboxes.anoncost) )
					DermaCheckbox:SetValue( 0 )
					DermaCheckbox:SizeToContents()	

			local DButton = vgui.Create("DButton", Frame)
				DButton:SetPos( 560, 465 )
				DButton:SetText( "Send the letter" )
				DButton:SetSize( 200, 50 )
				DButton.DoClick = function()
				if not ssteamid then DButton:SetText( "You forgot to select a recipient" ) return false end
				if (DermaNumSlider:GetValue() + ((DermaCheckbox:GetChecked() and 1 or 0)*mailboxes.anoncost)) > LocalPlayer():getDarkRPVar("money") then DButton:SetText( "You you don't have enough money !" ) return false end;
					net.Start("permapro-letterboxuseend")
					net.WriteString(ssteamid)
					net.WriteString(TextEntry:GetValue())
					net.WriteInt(DermaNumSlider:GetValue(), 16)
					net.WriteBool(DermaCheckbox:GetChecked())
					net.SendToServer()
					Frame:Close()
				end

			local 	DComboBoxSendTo = vgui.Create( "DComboBox", Frame )
			DComboBoxSendTo:SetPos( 760, 465 )
			DComboBoxSendTo:SetSize( 200, 50 )
			DComboBoxSendTo:SetValue( "Recipient" )
			for k,v in pairs(player.GetAll()) do
				DComboBoxSendTo:AddChoice( v:Nick(), v:SteamID())
			end
			DComboBoxSendTo.OnSelect = function( panel, index, value, data )
				ssteamid = data
			end
	


end

net.Receive("permapro-letterboxusestart",function ()
	local isadmin = net.ReadBool()
	local id = net.ReadInt(19);
	if not isadmin then writeletter() return end
	local Frame = vgui.Create( "DFrame" )
			Frame:SetSize( 360, 70 )
			Frame:SetTitle( "Send a letter ?" )
			Frame:SetVisible( true )
			Frame:SetDraggable( true )
			Frame:ShowCloseButton( true )
			Frame:MakePopup()
			Frame:Center() 
			local DButton = vgui.Create("DButton", Frame)
				DButton:SetPos( 25, 30 )
				DButton:SetText( "Disable/Enable this Post Box" )
				DButton:SetSize( 150, 30 )
				DButton.DoClick = function()
					net.Start("permapro-letterboxtoggle")
					net.WriteInt(id, 19)
					net.SendToServer()
					Frame:Close()
				end
		local DButton1 = vgui.Create("DButton", Frame)
				DButton1:SetPos( 180, 30 )
				DButton1:SetText( "Send a letter" )
				DButton1:SetSize( 150, 30 )
				DButton1.DoClick = function()
					writeletter()
					Frame:Close()
				end

end)

net.Receive("permapro-lettersenttableplayer",function()
	mailboxes.mails = net.ReadTable()
end)

net.Receive("permapro-lettersenttableplayersingle",function()
	mailboxes.mails[net.ReadString()] = net.ReadTable()
end)

