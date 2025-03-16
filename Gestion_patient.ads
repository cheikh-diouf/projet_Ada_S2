
with Gestion_outils ; 
use Gestion_outils; 

package Gestion_Patients is 
    type T_Patient  is record 
      pers: T_identite; 
      Nom_Jeune_Fille_Mere :T_mots; 
      k_nom_jfm: natural:=0; 
      Login : T_Motlong; 
      Empreinte_Mdp : Integer; 
      Documents : T_pt_Doc 
      end record;
end Gestion_Patients;