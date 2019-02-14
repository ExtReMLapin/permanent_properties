mailboxes = mailboxes or {}
mailboxes.mails = mailboxes.mails or {}
mailboxes.anoncost = 100
if SERVER then 
	include("server/network.lua")
	include("server/mails.lua")
	include("server/pos.lua")
	AddCSLuaFile("client/network.lua")
	AddCSLuaFile("client/derma.lua")
else
	include("client/network.lua")
	include("client/derma.lua")
end



hook.Add( "PhysgunPickup", "perma properties mailbox", function(ply, ent) -- for god sake, stop touching my mailboxes
	if ent:GetClass() == "perma_mailbox" then return false end
end )