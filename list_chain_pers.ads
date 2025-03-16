with gestion_personnel; 
use gestion_personnel; 

Package c  is
    type T_cellule; 
    type T_pt_pers is access T_cellule 
    type T_cellule is record 
        pers: T_personnels 
        suivpers: T_pt_pers; 
    end record; 
end  ListeChain_personnel ;
