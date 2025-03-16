with Ada.text_io;
use Ada.text_io;


package Gestion_outils is 
-- Types pour les noms, prénoms, etc. 
    subtype T_mots is String(1..50); 
    Type T_identite is record 
        prenom,nom:T_mots:= (others=>' ' );  
        k_nom,k_prenom: natural:=0; 
    end record; 
    subtype T_Motlong is String(1..50);
-- Types pour les erreurs 
    type Erreur is (login_indispo, Mot_De_Passe_Incorrect, Patient_Non_Trouve, Personnel_Non_Trouve);
end Gestion_outils;
                    