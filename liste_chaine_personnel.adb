WITH Ada.Text_IO, Ada.Integer_Text_IO, Ada.Characters.Handling, liste_chaine_personnel, gestion_outils, gestion_personnel;
USE Ada.Text_IO, Ada.Integer_Text_IO, Ada.Characters.Handling, liste_chaine_personnel, gestion_outils, gestion_personnel;

PACKAGE BODY liste_chaine_personnel IS

Procedure Initialisation_personnel(tete:out t_pt_pers)is 
pers: T_Personnel;
begin
Pers.identite.prenom(1..3):="ADA";
Pers.identite.K_prenom:=3;
Pers.identite.nom(1..8):="LOVELACE";
Pers.identite.K_nom:=8;
Pers.nom_jfm_pers(1..5):="BYRON";
pers.k_nom_jfm:=5;
Pers.Login_pers:=("LOVELACE_ADA"&(13..50 => ' '), 12);
Pers.empreinte_pers:=1263;
Pers.fonction:=Medecin;
tete:= New T_cellule_pers'(pers,Null);
skip_line;

Pers.identite.prenom(1..4):="JANE";
Pers.identite.K_prenom:=4;
Pers.identite.nom(1..4):="EYRE";
Pers.identite.K_nom:=4;
Pers.nom_jfm_pers(1..6):="BRONTE";
pers.k_nom_jfm:=6;
Pers.Login_pers:=("EYRE_JANE"&(10..50=>' '),9);
Pers.empreinte_pers:=1158;
Pers.fonction:=Secretaire;
tete.suivpers:= New T_cellule_pers'(pers,Null);


Pers.identite.prenom(1..6):="PIERRE";
Pers.identite.K_prenom:=6;
Pers.identite.nom(1..9):="SYLVESTRE";
Pers.identite.K_nom:=9;
Pers.nom_jfm_pers(1..6):="RAYNAL";
pers.k_nom_jfm:=6;
Pers.Login_pers:=("SYLVESTRE_PIERRE"&(17..50=>' '),16);
Pers.empreinte_pers:=1234;
Pers.fonction:=Medecin;
tete.suivpers.suivpers:= New T_cellule_pers'(pers,Null);

Pers.identite.prenom(1..8):="SERAPHIN";
Pers.identite.K_prenom:=8;
Pers.identite.nom(1..7):="LAMPION";
Pers.identite.K_nom:=7;
Pers.nom_jfm_pers(1..5):="HERGE";
pers.k_nom_jfm:=5;
Pers.Login_pers:=("LAMPION_SERAPHIN"&(17..50=>' '),16);
Pers.empreinte_pers:=1720;
Pers.fonction:=Secretaire;
tete.suivpers.suivpers.suivpers:= New T_cellule_pers'(pers,Null);

Pers.identite.prenom(1..4):="EMMA";
Pers.identite.K_prenom:=4;
Pers.identite.nom(1..6):="BOVARY";
Pers.identite.K_nom:=6;
Pers.nom_jfm_pers(1..8):="FLAUBERT";
pers.k_nom_jfm:=8;
Pers.Login_pers:=("BOVARY_EMMA"&(12..50=>' '),11);
Pers.empreinte_pers:=1119;
Pers.fonction:=Medecin;
tete.suivpers.suivpers.suivpers.suivpers:= New T_cellule_pers'(pers,Null);

Pers.identite.prenom(1..6):="LUCIEN";
Pers.identite.K_prenom:=6;
Pers.identite.nom(1..6):="LADMIN";
Pers.identite.K_nom:=6;
Pers.nom_jfm_pers(1..3):="MUM";
pers.k_nom_jfm:=3;
Pers.Login_pers:=("LADMIN_LUCIEN"&(14..50=>' '),13);
Pers.empreinte_pers:=194;
Pers.fonction:=Administrateur;
tete.suivpers.suivpers.suivpers.suivpers.suivpers:= New T_cellule_pers'(pers,Null);
end Initialisation_personnel;

-----------------------------------------------------

procedure Ajout_pers ( tete: in out T_pt_pers ) is 
pers : T_Personnel;
begin
saisie_personne(pers);
--Saisie_Identite(pers.identite);
--pers.login_pers := Creation_Login(pers.identite); 
if Rechercher_Pers(tete, pers.login_pers) /= null then
Put_line("la personne existe deja");
else
tete := new T_cellule_pers'(Pers, tete);
end if;
end Ajout_pers;

----------------------------------------------------

Procedure Affichage_liste (tete: in T_pt_pers ) is
begin 
If tete /= null then Visu_Pers(tete.pers);
Affichage_liste (tete.suivpers); 
end if;
end Affichage_liste;

--------------------------------------------------- 

procedure Supp_liste (tete : in out T_pt_pers; identite: in T_identite) is 
begin
If tete/= null then 
    if tete.pers.identite = identite then tete :=  tete.suivpers; 
     else Supp_liste(tete.suivpers, identite);
    end if;
end if;
end Supp_liste;

-------------------------------------------------------
FUNCTION Rechercher_Pers (tete : IN T_pt_pers; Login : IN T_titre) RETURN t_pt_pers IS
BEGIN
   IF tete = Null THEN
      RETURN null;
   ELSIF Tete.pers.login_pers = login THEN
      RETURN tete;
   ELSE
      RETURN Rechercher_Pers(tete.suivpers, Login);
   END IF;
END Rechercher_Pers;

-----------------------------------------------------------

end liste_chaine_personnel; 

