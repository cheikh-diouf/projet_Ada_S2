Package Arbre_Patient  
with Gestion_outils; 

Package Arbre_Patient IS 
      type T_Noeud_Patient ; 
      type T_arbre_Patients is access T_Noeud_Patient; 
      type T_Noeud_Patient is record 
            cle : T_Patient; 
            fg ,fd : T_arbre_Patients; 
      end record; 
end Arbre_Patients; 