WITH Ada.Text_IO, Ada.Integer_Text_IO, Ada.Characters.Handling, liste_chaine_personnel;
USE Ada.Text_IO, Ada.Integer_Text_IO, Ada.Characters.Handling, liste_chaine_personnel;

PACKAGE BODY liste_chaine_personnel IS

-----------------------------------------------------

procédure Ajout_pers (pers: in t_personnel, tete: in out T_pt_pers ) is 
P:= t_pt_pers := tete; 
begin
if P.pers.exist := false then 
if tete = nul then tete:= new T_cellule_pers'(pers,tete);
else P.suiv := new T_cellule_pers'(pers, P.suiv);
end if; 
else Put_line("la personne existe déjà");
end if;
end Ajout_pers;

----------------------------------------------------

Procédure Affichage_liste (tete: in T_pt ) is; 
begin 
If tete /= nul then put (tete.pers)
Affichage_liste (tete.suiv);
end if 
end Affichage_liste;

--------------------------------------------------- 

procédure Supp_liste (tete : in out T_pt_pers) is ; 
begin
If tete/= nul then 
    if tete.pers.identité := identité then tete :=  tete.suiv; 
     else Supp_liste(tete.suiv);
    end if 
en if 
end Supp_liste;

-------------------------------------------------------

end liste_chaine_personnel; 

