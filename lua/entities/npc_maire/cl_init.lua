include('shared.lua')

surface.CreateFont( "HUDNumber5", {
    font = "HudNumbers",
    size = 13,
    weight = 500,
} )

function dont () 
local AnnonceMaire = vgui.Create( "DFrame" )
AnnonceMaire:SetPos( ScrW()/2-150, ScrH()/2-150 )
AnnonceMaire:SetSize( 400, 200 )
AnnonceMaire:Center()
AnnonceMaire:SetTitle("")
AnnonceMaire:ShowCloseButton( false )
AnnonceMaire:SetDraggable(true)
AnnonceMaire:SetVisible( true )
AnnonceMaire:MakePopup()
AnnonceMaire.Paint = function()
	 draw.RoundedBox( 4, 0, 0, AnnonceMaire:GetWide(), AnnonceMaire:GetTall(), Color( 0,0, 0, 255	 ) )
	 draw.SimpleText("Faire une Annonce aux peuple !", "Trebuchet24", 10, 10,Color(255,255,255,255),TEXT_ALIGN_LEFT)
	 draw.SimpleText("L'annonce coûte 250€", "Trebuchet24", 100, 165,Color(255,255,255,255),TEXT_ALIGN_LEFT) 
    
end
local CloseButton = vgui.Create("DButton", AnnonceMaire)
CloseButton:SetSize(AnnonceMaire:GetWide() / 10, AnnonceMaire:GetTall() / 6- 5) 
CloseButton:AlignRight(8)
CloseButton:AlignTop(8)
CloseButton:SetText("")
CloseButton.DoClick = function()

AnnonceMaire:Close()

end
CloseButton.Paint = function(self)

draw.RoundedBox(0,0,0,CloseButton:GetWide(),CloseButton:GetTall(),Color(255,0,0,255))

draw.DrawText("X ","Trebuchet24",CloseButton:GetWide() / 4+1,CloseButton:GetTall() / 11,Color(255,255,255,255),TEXT_ALIGN_LEFT) 

if CloseButton:IsHovered() then

draw.DrawText("X ","Trebuchet24",CloseButton:GetWide() / 4+1,CloseButton:GetTall() / 11-2,Color(255,255,255,255),TEXT_ALIGN_LEFT) 
end

end
local TextMaire = vgui.Create( "DTextEntry", TextMaire )
TextMaire:SetPos( 25, 50 )
TextMaire:SetSize( 300, 25 )
TextMaire:SetParent( AnnonceMaire ) 
TextMaire:SetText("Veuillez saisir votre message ici même...")
TextMaire.OnEnter = function( self )
Text = self:GetValue()

net.Start( "Maire" )
    net.WriteString( TextMaire:GetValue() )
net.SendToServer()

end
DButtonMaire = vgui.Create("DButton",DButtonMaire)
DButtonMaire:SetText("Envoyer")
DButtonMaire:SetParent( AnnonceMaire )  
DButtonMaire:SetPos(145,100)
DButtonMaire:SetTextColor( Color( 0, 0, 0, 250 ) )
DButtonMaire:SetFont("Trebuchet24")
DButtonMaire:SetSize(100,50)
DButtonMaire.Paint = function( self, w, h )
    draw.RoundedBox( 5, 0, 0, w, h, Color( 255, 255, 255, 255 ) )
end
DButtonMaire.DoClick = function()
AnnonceMaire:Close()
TextMaire:GetValue()
net.Start( "bouttonmaire" )
    net.WriteString( TextMaire:GetValue() )
net.SendToServer()





end



end


usermessage.Hook("dont", dont) 

hook.Add("PostDrawOpaqueRenderables", "dont", function() 
	for _, ent in pairs (ents.FindByClass("npc_maire")) do 
		if ent:GetPos():Distance(LocalPlayer():GetPos()) < 1000 then
			local Ang = ent:GetAngles()

			Ang:RotateAroundAxis( Ang:Forward(), 90)
			Ang:RotateAroundAxis( Ang:Right(), -90)
		
			cam.Start3D2D(ent:GetPos()+ent:GetUp()*79, Ang, 0.20)
				draw.SimpleTextOutlined( 'NPC Annonce Maire', "HUDNumber5", 0, 0, Color( 255, 0, 0, 255 ), TEXT_ALIGN_CENTER, TEXT_ALIGN_TOP, 1, Color(0, 0, 0, 255))			
			cam.End3D2D()
		end
	end
end)
