AddCSLuaFile( "cl_init.lua" )
AddCSLuaFile( "shared.lua" )

include('shared.lua')

function ENT:Initialize( )
	
	self:SetModel( "models/breen.mdl" ) 
	self:SetHullType( HULL_HUMAN )
	self:SetHullSizeNormal( )
	self:SetNPCState( NPC_STATE_SCRIPT )
	self:SetSolid(  SOLID_BBOX )
	self:CapabilitiesAdd( CAP_ANIMATEDFACE )
	self:SetUseType( SIMPLE_USE )
	self:DropToFloor()
	self:SetMaxYawSpeed( 90 )
	
end

function ENT:OnTakeDamage()
	return false 
end 

function ENT:AcceptInput( Name, Activator, Caller )	

	if Name == "Use" and Caller:IsPlayer() then
		  if team.GetName(Caller:Team()) == "Mayor" then
		umsg.Start("dont", Caller) 
		umsg.End()
		
	end
	
end
end

util.AddNetworkString( "Maire" )
net.Receive( "Maire", function(length, ply)
 local money = ply:getDarkRPVar("money")   if money >= 250 then
   DarkRP.notify(ply,0,7,"Vous avez acheté une Annonce pour 250€!")
ply:addMoney(250 * -1)
 else
  DarkRP.notify(ply,1,7,"Vous n'avez pas assez d'argent pour faire une annonce a votre peuple")
return false
end
local Text = net.ReadString()
 for k,v in pairs(player.GetAll()) do
DarkRP.talkToPerson(v, Color(255,0,0), "[Annonce du maire] ", Color(255,0,0), Text, nil)
end
end)

util.AddNetworkString( "bouttonmaire" )
net.Receive( "bouttonmaire", function(length, ply)
 local money = ply:getDarkRPVar("money")   if money >= 250 then
   DarkRP.notify(ply,0,7,"Vous avez acheté une Annonce pour 250€!")
ply:addMoney(250 * -1)
 else
  DarkRP.notify(ply,1,7,"Vous n'avez pas assez d'argent pour faire une annonce a votre peuple")
return false
end
local Text = net.ReadString()
 for k,v in pairs(player.GetAll()) do
DarkRP.talkToPerson(v, Color(255,0,0), "[Annonce du maire] ", Color(255,0,0), Text, nil)
end
end)