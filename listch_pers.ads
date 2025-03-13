Package ListeChain_personnel 
with gestion_personnel; 
use gestion_personnel; 
type T_cellule; 
type T_pt_pers is access T_cellule 
type T_cellule is record 
pers: T_personnels 
suivpers: T_pt_pers; 
end record; 