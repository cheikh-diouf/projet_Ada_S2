WITH Ada.Text_IO; 
USE Ada.Text_IO;
 
PACKAGE gestion_date is

  subtype T_mois is (janvier, fevrier, mars, avril, mai, juin, juillet, aout, septemmbre, octobre, novembre, decembre);
  subtype T_int_jour is integer range 1..31;
 
    Type t_date is record
     jour: T_int_jour;
     mois: T_mois;
     annee: natural;
    end record;

FUNCTION Bissextile (Annee : Natural) RETURN Boolean; 
FUNCTION Nombre_Jour (Mois  : T_mois; Annee : Natural) RETURN Integer ;
PROCEDURE Saisie_Date (D :    OUT T_Date);
PROCEDURE Affichage_Date (D : IN     T_Date);
PROCEDURE Lendemain (D : IN OUT T_Date); 


end gestion_date;
