WITH Ada.Text_IO, Ada.Characters.Handling, Ada.Integer_Text_IO, gestion_outils;
USE Ada.Text_IO, Ada.Characters.Handling, Ada.Integer_Text_IO, gestion_outils;

 package gestion_personnel is 
    type T_fonction is (medecin, secretaire, administrateur);
    type T_personnel is record 
        identite: T_identite; 
        nom_jfm_pers: T_mot; 
        login_pers: t_titre; 
        k_nom_jfm: natural:=0; 
        empreinte_pers: natural ; 
        fonction: T_fonction;
        exist: Boolean;  
    end record; 

PROCEDURE Visu_Pers (Pers : IN T_personnel);
PROCEDURE Saisie_Personne (Pers : OUT T_Personnel);
FUNCTION Creation_login (identite: T_identite ) RETURN T_titre;

 end gestion_personnel;