Package Gestion_Personnel 
 with gestion_type; 
 use gestion _type; 
 package Gestion_personnel is 
 type T_fonction is (médecin, secrétaire, administrateur) 
 type T_personnel is record 
 identité: T_idendite; 
 nom_jfm_pers: T_mots; 
 login_pers: T_Motlong; 
k_nom_jfm, k_login: natural:=0; 
 empreint_pers: natural ; 
 fonction: T_fonction;  
 end record; 
 end gestion_personnel;