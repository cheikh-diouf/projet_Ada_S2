WITH Ada.Text_IO, Ada.Characters.Handling, Ada.Integer_Text_IO;
USE Ada.Text_IO, Ada.Characters.Handling, Ada.Integer_Text_IO;
PACKAGE BODY gestion_outils IS


PROCEDURE Saisie_Identite (Identite :    OUT T_identite) IS
BEGIN
   Put("saisissez un prenom : ");
   Saisie_Mot(Identite.Prenom);
   Put("saisissez un nom : ");
   Saisie_Mot(Identite.Nom);
END Saisie_Identite;

--------------------------------------------------------

PROCEDURE Affiche_Identite (Identite : IN     T_identite) IS
BEGIN
   Put("prenom : ");
   Put(Identite.Prenom);
   Put("nom : ");
   Put(Identite.Nom);
END Affiche_Identite;

------------------------------------------------------------------

PROCEDURE Saisie_Mot (Mot :    OUT T_mot) IS
   K  : Integer;
   Ok : Boolean;
   BEGIN
      LOOP
         Get_Line (Mot,K);
         Ok:=True;
         Mot:=To_Upper (Mot);
         FOR I IN 1..K LOOP
            CASE Mot(I) IS
               WHEN 'A'..'Z' =>
                  NULL;
               WHEN '-'|' '|''' =>
                  IF ((I=Mot'First) OR ELSE (I=K)) OR ELSE NOT (Mot(I-1) IN 'A'..'Z') THEN
                     Ok:=False;
                     EXIT;
                  END IF;
               WHEN OTHERS =>
                  Ok:=False;
                  EXIT;
            END CASE;
         END LOOP;
         EXIT WHEN Ok=True;
         Put_Line ("erreur de saisie");
      END LOOP;
END Saisie_Mot;

-----------------------------------------------------------------------
   
PROCEDURE Saisie_Mdp (Mdp :IN OUT T_Mdp) IS
   Saisie:boolean;
   k:integer;
BEGIN
   LOOP
      begin
         Mdp :=(" "); -------mot de passe vide 
         Put_Line("Veuillez saisir votre mot de passe, en utilisant des lettres majuscules et minuscules,des chiffres et les caractères suivants : #,*,.,!,?,$");
         Get_Line(Mdp,K);
         Exit when k=10;
         saisie:=Verif_Mdp(Mdp);
         EXIT WHEN Saisie=True;
         EXCEPTION
         WHEN Constraint_Error => Put_Line("Erreur de saisie");
         WHEN Data_Error => Put_Line("Veuillez utiliser les caractères autorisés");
      end;
   END LOOP;
END Saisie_Mdp;

-----------------------------------------------------------------------
FUNCTION Verif_Mdp (Mdp:T_Mdp) RETURN Boolean IS
   Saisie_Mdp:Boolean;
   BEGIN
      FOR I IN 1..10 LOOP -- on regarde pour chaque caractère si c'est valide --
         CASE Mdp(I) IS
            WHEN 'a'..'z'|'A'..'Z'|'#'|'*'|'.'|'!'|'?'|'$'|'0'..'9' => Saisie_Mdp:=True;
               When others => Saisie_Mdp:=False;
               Exit;
            end case;
      End Loop;
   RETURN (Saisie_Mdp);
END Verif_Mdp;

-----------------------------------------------------------------------------------

Procédure saisie_login (login : in out T_motlong) is 
Begin 






end Saisie_login

-----------------------------------------------------------------------------------

Procédure Affichage_login (login : in T_montlong) is 
begin 
put ("votre login est :");
put(login);
end affichage_login; 


END Gestion_Outils;
