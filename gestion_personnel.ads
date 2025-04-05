with Gestion_outils; 
use Gestion_outils; 

 package gestion_personnel is 
    type T_fonction is (médecin, secrétaire, administrateur);
    type T_personnel is record 
        identité: T_idendite; 
        nom_jfm_pers: T_mots; 
        login_pers: T_motlong; 
        k_nom_jfm, k_login: natural:=0; 
        empreint_pers: natural ; 
        fonction: T_fonction;
        exist: Boolean;  
    end record; 
 end gestion_personnel;