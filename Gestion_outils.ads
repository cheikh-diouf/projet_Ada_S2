with Ada.text_io;
use Ada.text_io;


package gestion_outils is 
-- Types pour les noms, prénoms, etc. 
    subtype T_mot is String(1..20); 
    Type T_identite is record 
        prenom,nom:T_mot:= (others=>' ' );  
        k_nom,k_prenom: natural:=0; 
    end record; 
    subtype mot_long is String(1..50);
    type T_titre is record
        titre: mot_long:= (others=>' ' );  
        k_titre: natural:=0;  -- a demander a annie !
        end record;
    subtype t_mdp is string (1..10);

PROCEDURE Saisie_Identite (Identite :    OUT T_identite);
PROCEDURE Affiche_Identite (Identite : IN     T_identite);
PROCEDURE Saisie_Mot (Mot :    OUT T_mot; k : out integer);
PROCEDURE Saisie_Mdp (Mdp :in out T_mdp);
FUNCTION Verif_Mdp (Mdp:T_Mdp) RETURN Boolean;
FUNCTION Calculer_Empreinte(Mdp : IN T_Mdp) RETURN Natural;
PROCEDURE Saisie_Titre ( T : OUT T_Titre);

end gestion_outils;
                    