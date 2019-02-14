util.AddNetworkString( "permapro-letterboxusestart" )
util.AddNetworkString( "permapro-letterboxuseend" )
util.AddNetworkString( "permapro-letterboxtoggle" )
util.AddNetworkString( "permapro-lettersenttableplayer")
util.AddNetworkString( "permapro-lettersenttableplayersingle")
util.AddNetworkString( "permapro-openedletter")

net.Receive("permapro-letterboxuseend",function (len,ply)
	local cmdorsteam = net.ReadString()
	local text = net.ReadString()
	local moneyammount = math.abs(net.ReadInt(16))
	local anon = net.ReadBool()
	if ply:getDarkRPVar("money") > moneyammount then
		ply:addMoney(-moneyammount)
		if anon then 
			if ply:getDarkRPVar("money") < mailboxes.anoncost then return print("CHEATER " .. ply:SteamID()) end
			ply:addMoney(-(mailboxes.anoncost)) 
		end
		mailboxes.NewLetter(ply,cmdorsteam, text, moneyammount, anon )
	else
		ErrorNoHalt(Format("Player : %s with SteamID  : %s tried to give more money than he has, wtf, he may be cheating", ply:Nick(), ply:SteamID()))
	end

end)


net.Receive("permapro-letterboxtoggle", function(len,ply)
		local cid = net.ReadInt(19)
		if not ply:IsAdmin() then return end
		for k, v in pairs(ents.GetAll()) do
			if v:GetCreationID() == cid then
				v:SetEnabled(! v:GetEnabled())
				break
			end
		end
end)