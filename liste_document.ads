Package Liste_document 
with gestion_document; 
use gestion_document; 

Package Liste_document 
    Type T_List_Document
    Type T_pt  is access T_List_Document 
    Type T_ListDoc is record 
        Doc : T_Document; 
        suivDoc: T_pt_Doc; 
    end record; 
end Liste_Documents; 
    -- Opérations sur les documents 
Procedure Ajouter_Document(Titre : in String; Nature : in Nature_Document; Medecin : in   
Personnel.Personnel_Record; Patient : in Patients.Patient_Record); 
function Rechercher_Document(Identifiant : in Integer) return Document_Record; 
procedure Afficher_Documents;