with gestion_personnel; 
use gestion_personnel; 

Package liste_chaine_personnel is
    type T_cellule_pers; 
    type T_pt_pers is access T_cellule_pers 
    type T_cellule_pers is record 
        pers: T_personnel; 
        suivpers: T_pt_pers; 
    end record;

    type T_liste_pers is record
      tete: t_pt_pers; 
    end record;


procédure Ajout_pers (pers: in t_personnel, tete: in out T_pt_pers);
procédure Affichage_liste (tete: in T_pt );
procédure Supp_liste (tete : in out T_pt_pers)

end  liste_chaine_personnel ;