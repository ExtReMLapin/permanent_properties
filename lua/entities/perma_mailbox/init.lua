

include("shared.lua");
AddCSLuaFile("cl_init.lua");
AddCSLuaFile("shared.lua");

function ENT:Initialize()
	self:SetModel("models/props_street/mail_dropbox.mdl")
	self:SetMoveType( MOVETYPE_VPHYSICS )
	self:SetSolid( SOLID_VPHYSICS )
	self:SetUseType(SIMPLE_USE)
	self:PhysicsInit( SOLID_VPHYSICS )
	self:GetPhysicsObject():EnableMotion(false)
	self:SetEnabled(true);
end

function ENT:SpawnFunction( ply, tr, ClassName )
	if ( !tr.Hit ) then return end
	local ent = ents.Create( ClassName )
	local SpawnPos = tr.HitPos +Vector(0,0,0)
	ent:SetPos( SpawnPos )
	ent:SetAngles(Angle(0,ply:GetAngles().y,0) - Angle(0,180,0))
	ent:Spawn()
	ent:Activate()
	
	return ent
	
end

function ENT:Use( ply )
	if not self:GetEnabled() and not ply:IsAdmin() then return end
	net.Start("permapro-letterboxusestart")
	net.WriteBool(ply:IsAdmin())
	net.WriteInt(self:GetCreationID(), 19 )
	net.Send(ply)
end