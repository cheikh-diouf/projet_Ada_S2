with gestion_personnel, gestion_outils; 
use gestion_personnel, gestion_outils;

Package liste_chaine_personnel is
    type T_cellule_pers; 
    type T_pt_pers is access T_cellule_pers; 
    type T_cellule_pers is record 
      pers: T_personnel; 
      suivpers: T_pt_pers; 
    end record;
    type T_liste_pers is record
      tete: t_pt_pers; 
    end record;

Procedure Initialisation_personnel(tete:out t_pt_pers);
procedure Ajout_pers ( tete: in out T_pt_pers );
procedure Affichage_liste (tete: in t_pt_pers);
procedure Supp_liste (tete : in out T_pt_pers; identite: in T_identite);
FUNCTION Rechercher_Pers (tete : IN T_pt_pers; Login : IN T_titre) RETURN t_pt_pers;

end  liste_chaine_personnel ;