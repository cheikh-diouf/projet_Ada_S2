with 
use 

package Gestion_file_Mdp is
    type T_cellMdp 
    type T_pt is access  T_cellMdp 
    type T_cellMdp is record 
        Mdp: Demande : Demande Mdp Oublie; 
        suiv:T_pT; 
    end record; 
    type File_Mdp is record 
        tete ,fin :T_pt; 
    end record; 
    -- Opérations sur les demandes 
    procédure Ajouter_ Demande(Login : in String; Nom_Jeune_Fille_Mere : in String; 
Est_Patient : in Boolean); 
    function Traiter_Demande return Demande_Mdp_Oubli; 
    procedure Afficher_Demandes; 
end Gestion_file_Mdp;