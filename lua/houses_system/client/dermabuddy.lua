--[[
**** Contain all the derma used in a 2d way, not 3D2D 
--]]


function houses.opentransferrightsmenu(id)
	local DermaPanel = vgui.Create( "DFrame" )
		local selected ;
			DermaPanel:SetSize( 550, 200 )
			DermaPanel:SetTitle( houses.titlerights  )
			DermaPanel:Center()
			DermaPanel:ShowCloseButton(true)
			DermaPanel:SetDraggable( true )
			DermaPanel:MakePopup()
			local DLabel = vgui.Create( "DLabel", DermaPanel )
			DLabel:SetPos( 10, 40 )
			DLabel:SetSize(500, 40)
			DLabel:SetText(houses.textrights )
	
			local DComboBox = vgui.Create( "DComboBox", DermaPanel )
			local yes  = vgui.Create( "DButton",DermaPanel )
				DComboBox:SetPos( 30, 100 )
				DComboBox:SetSize( 250, 20 )
				for k, v in pairs(player.GetAll()) do
					if v:SteamID() != LocalPlayer():SteamID() then
						DComboBox:AddChoice(v:Nick(), v:SteamID())
					end
				end
				DComboBox.OnSelect = function( index, value, data , realdata)
					selected = realdata
					yes:SetText( houses.buttons .. data )
				end
				yes:SetPos( 350, 100 )
				yes:SetText( houses.buttond )
				yes:SetSize( 120, 60 )
				yes.DoClick = function()
					net.Start("houses_command")
					net.WriteUInt(id, 7)
					net.WriteUInt(6,4)
					net.WriteString(selected or "")
					net.SendToServer()
					DermaPanel:Remove()
				end
end



function houses.opensellmenu(id)
			
		local DermaPanel = vgui.Create( "DFrame" )
			DermaPanel:SetSize( 450, 200 )
			DermaPanel:SetTitle( houses.sellhousederma )
			DermaPanel:Center()
			DermaPanel:ShowCloseButton(true)
			DermaPanel:SetDraggable( true )
			DermaPanel:MakePopup()
			local DLabel = vgui.Create( "DLabel", DermaPanel )
			DLabel:SetPos( 40, 40 )
			DLabel:SetSize(400, 40)
			DLabel:SetText( houses.sellhousedermatext )

			local yes  = vgui.Create( "DButton",DermaPanel )
				yes:SetPos( 100, 100 )
				yes:SetText( houses.selldermayes )
				yes:SetSize( 100, 60 )
				yes.DoClick = function()
					net.Start("houses_command")
					net.WriteUInt(id, 7)
					net.WriteUInt(7, 4)
					net.SendToServer()
					DermaPanel:Remove()
				end
			
			local bo = vgui.Create( "DButton",DermaPanel )
				bo:SetPos( 220, 100 )
				bo:SetText( houses.selldermano ) -- that's the only thing you say to the god of the death
				bo:SetSize( 100, 60 )
				bo.DoClick = function()
					DermaPanel:Remove()
					if math.random(10) == 5 then 
						surface.PlaySound("vo/outland_11/dogfight/al_str_goodboy.wav")
					end
				end
end


function houses.createbuddiespanel(id)
	local DermaPanel = vgui.Create( "DFrame" )
	DermaPanel:SetSize( 900, 450 )
	DermaPanel:SetTitle( houses.buddiestitle )
	DermaPanel:Center()
	DermaPanel:ShowCloseButton(true)
	DermaPanel:SetDraggable( true )
	DermaPanel:MakePopup()

	local PlayerList = vgui.Create( "DListView",DermaPanel)
	PlayerList:SetMultiSelect( false )
	PlayerList:AddColumn(houses.buddiestitle2 )
	PlayerList:AddColumn( "SteamID" )
	PlayerList:SetPos(3,30)
	PlayerList:SetSize(400,300)

	local BuddiesList = vgui.Create( "DListView",DermaPanel)
	BuddiesList:SetMultiSelect( false )
	BuddiesList:AddColumn( houses.buddiestitle3 )
	BuddiesList:AddColumn( "SteamID" )
	BuddiesList:SetPos(503,30)
	BuddiesList:SetSize(395,300)

	local add = vgui.Create( "DButton",DermaPanel )
		add:SetPos( 440, 130 )
		add:SetText( ">>" )
		add:SetSize( 30, 30 )
		add.DoClick = function()
			if not PlayerList:GetSelectedLine() then return end
			local selected = PlayerList:GetSelectedLine()
			local line = PlayerList:GetLines()
			BuddiesList:AddLine(line[selected]:GetValue(1), line[selected]:GetValue(2))
			PlayerList:RemoveLine(selected)
		end

	local remove = vgui.Create( "DButton",DermaPanel )
		remove:SetPos( 440, 170 )
		remove:SetText( "<<" )
		remove:SetSize( 30, 30 )
		remove.DoClick = function()
			if not BuddiesList:GetSelectedLine() then return end
			local selected = BuddiesList:GetSelectedLine()
			local line = BuddiesList:GetLines()
			PlayerList:AddLine(line[selected]:GetValue(1), line[selected]:GetValue(2))
			BuddiesList:RemoveLine(selected)


		end

	for k, v in pairs(player.GetAll()) do
		if v:SteamID() == LocalPlayer():SteamID() then continue end -- dnt ad urself lel
		if table.HasValue(houses.list[id].friends,v:SteamID() ) then continue end --dnt ad ur friend twic lel
		PlayerList:AddLine( v:Nick(), v:SteamID() )
	end

	for k, v in pairs(houses.list[id].friendsname) do
		BuddiesList:AddLine( v, houses.list[id].friends[k] )
	end

	local send  = vgui.Create( "DButton",DermaPanel )
		send:SetPos( 395, 370 )
		send:SetText( houses.buddiestitlego )
		send:SetSize( 120, 37 )
		send.DoClick = function()
			local lines = BuddiesList:GetLines()

			local tbl1 = {}
			local tbl2 = {}
			for k, v in pairs(lines) do
				tbl1[k] = v:GetValue(1)
				tbl2[k] = v:GetValue(2)
			end
			net.Start("houses_command")
			net.WriteUInt(id, 7)
			net.WriteUInt(8,4)
			net.WriteTable(tbl1)
			net.WriteTable(tbl2)
			net.SendToServer()
			DermaPanel:Remove()
		end
end
