ENT.Base = "base_ai" 
ENT.Type = "ai"
ENT.PrintName		= "NPC Annonce Maire" 
ENT.Category		= "NPC AYZ"
ENT.Instructions	= "Appuyer sur E (Touche 'USE')" 
ENT.Spawnable		= true 
ENT.AdminSpawnable		= true 
ENT.AutomaticFrameAdvance = true 

function ENT:SetAutomaticFrameAdvance(bUsingAnim) 
	self.AutomaticFrameAdvance = bUsingAnim 
end
