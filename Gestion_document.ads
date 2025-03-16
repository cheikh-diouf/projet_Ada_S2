with Gestion_outils; 
use Gestion_outils; 
package Gestion_Documents is 
   type T_Nat_Document is (Ordonnance, Certificat, Compte_Rendu, Resultats_Examens); 
   type T_Document is record 
        Id : Integer; 
        Titre_doc: T_Motlong:= (others=>' '); 
        Nature : T_Nat_Document; 
        Med : T_pt_pers; 
        Lecture : Boolean ; 
        Date_Creation : T_date; 
        Date_Derniere_Lect : T_date; 
        Date_Derniere_Modif : T_date; 
    end record;
end Gestion_Documents;