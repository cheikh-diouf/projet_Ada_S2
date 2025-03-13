Package Gestion_ Patient 
with Types; 
use Types; 
package Patients is 
    type T_Patient  is record 
      pers: T_identite; 
      Nom_Jeune_Fille_Mere :T_mots; 
    k_nom_jfm: natural:=0; 
     Login : T_Motlong; 
      Empreinte_Mdp : Integer; 
      Documents : T_pt_Doc 
    end record;