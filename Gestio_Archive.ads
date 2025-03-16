with Gestion_outils; 
use Gestion_outils; 
type T_Document_Archive is record 
        Id : Integer; 
        Titre_doc: T_Motlong:= (others=> ' '); 
        Nature : T_Nat_Document; 
        Med :T_identite; 
        pat:T_identite; 
        Lecture : Boolean ; 
        Date_Creation : T_date; 
        Date_Derniere_Lect : T_date; 
        Date_Derniere_Modif : T_date; 
    end record; 
package Gestion_Archives is new .Ada_sequential_io(T_document_Archive); 
     -- Opérations sur les archives 
    procédure Archiver Document(Document : in Documents.Document Record); 
    procédure Afficher Archives; 
end Gestion_Archives;