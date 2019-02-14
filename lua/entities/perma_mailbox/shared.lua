DEFINE_BASECLASS("base_gmodentity");

ENT.Type = "anim";
ENT.Author = "Lapin";
ENT.PrintName = "Mail Deposit box";
ENT.Spawnable = true;
ENT.AdminOnly = true;
ENT.Category  = "Permanent properties"

function ENT:SetupDataTables()
	self:NetworkVar( "Bool", 0, "Enabled" 	)
end