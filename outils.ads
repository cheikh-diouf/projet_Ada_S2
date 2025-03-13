Package outils_Type 
package outils is 
-- Types pour les noms, prénoms, etc. 
subtype T_mots is String(1..50); 
Type T_identite is record 
prenom,nom:T_mots (others=>’ ‘);  
k_nom ,k_prenom: natural:=0; 
subtype T_Motlong String(1..50); 
end record; 
-- Types pour les erreurs 
type Erreur is (login indispo, Mot_De_Passe_Incorrect, , Patient_Non_Trouve, 
Personnel_Non_Trouve);