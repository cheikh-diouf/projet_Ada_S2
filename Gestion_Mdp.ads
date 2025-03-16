with Types;  
use Types; 
package Gestion_Mdp is 
    type Demande_Mdp_Oublie is record 
        Login : T_Motlong; 
        Nom_Jfm :T_mots; 
        k_nom_jfm: natural:=0; 
       Est_Patient : Boolean; 
    end record;