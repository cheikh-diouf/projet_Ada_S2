with Ada.text_io;
use Ada.text_io;


package Gestion_outils is 
-- Types pour les noms, prénoms, etc. 
    subtype T_mot is String(1..20); 
    Type T_identite is record 
        prenom,nom:T_mot:= (others=>' ' );  
        k_nom,k_prenom: natural:=0; 
    end record; 
    subtype T_titre is String(1..50);
        titre:T_mot:= (others=>' ' );  
        k_titre: natural:=0;  -- a demander a annie !
    subtype t_mdp is string (1..10);

PROCEDURE Saisie_Identite (Identite :    OUT T_identite);
PROCEDURE Affiche_Identite (Identite : IN     T_identite);
PROCEDURE Saisie_Mot (Mot :    OUT T_mot);
FUNCTION Verif_Mdp (Mdp:T_Mdp) RETURN Boolean;
FUNCTION Calculer_Empreinte(Mdp : IN T_Mdp) RETURN Natural;
PROCEDURE Saisie_Titre ( T : OUT T_Titre);

end Gestion_outils;
                    