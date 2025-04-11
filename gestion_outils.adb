WITH Ada.Text_IO, Ada.Characters.Handling, Ada.Integer_Text_IO, gestion_outils;
USE Ada.Text_IO, Ada.Characters.Handling, Ada.Integer_Text_IO, gestion_outils;

PACKAGE BODY gestion_outils IS


PROCEDURE Saisie_Identite (Identite :  OUT T_identite) IS
BEGIN
   Put("saisissez un prenom : ");
   Saisie_Mot(Identite.Prenom, identite.k_prenom);
   Put("saisissez un nom : ");
   Saisie_Mot(Identite.Nom, identite.k_nom);
END Saisie_Identite;

------------------------------------------------------------------------

PROCEDURE Affiche_Identite (Identite : IN   T_identite) IS
BEGIN
   Put("Prenom : ");
   Put(Identite.Prenom(1..Identite.K_prenom));
   new_line;
   Put("Nom : ");
   Put(Identite.Nom(1..Identite.K_nom));
END Affiche_Identite;

------------------------------------------------------------------

PROCEDURE Saisie_Mot (Mot :    OUT T_mot; K : out integer) IS
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
   --Saisie:boolean;
   k:integer;
BEGIN
   LOOP
      begin
         Mdp := (others => ' ');    -------mot de passe vide 
         Put_Line("Veuillez saisir votre mot de passe de taille 10, en utilisant des lettres majuscules et minuscules,des chiffres et les caracteres suivants : #,*,.,!,?,$");
         Get_Line(Mdp,K);
         if k=10 then skip_line; end if;
        
         EXIT WHEN k = 10 and then Verif_Mdp(Mdp);
         EXCEPTION
         WHEN Constraint_Error => Put_Line("Erreur de saisie");
         WHEN Data_Error => Put_Line("Veuillez utiliser les caracteres autorises");
      end;
   END LOOP;
 
END Saisie_Mdp;

-----------------------------------------------------------------------
FUNCTION Verif_Mdp (Mdp:T_Mdp) RETURN Boolean IS
   Saisie_Mdp:Boolean;
   BEGIN
      FOR I IN 1..10 LOOP -- on regarde pour chaque caractere si c'est valide --
         CASE Mdp(I) IS
            WHEN 'a'..'z'|'A'..'Z'|'#'|'*'|'.'|'!'|'?'|'$'|'0'..'9' => Saisie_Mdp:=True;
               When others => Saisie_Mdp:=False;
               Exit;
            end case;
      End Loop;
   RETURN (Saisie_Mdp);
END Verif_Mdp;

-----------------------------------------------------------------------------------

PROCEDURE Saisie_Titre ( T : OUT T_Titre) IS  --saisie du login
BEGIN
   T.titre:=(Others=>(' '));
   Get_Line(T.titre, T.k_titre);
   T.titre:=To_Upper(T.titre);
END Saisie_Titre;

-----------------------------------------------------------------------------------

Procedure Affichage_login (login : in T_Titre) is 
begin 
put ("votre login est :");
put(login.titre);
end affichage_login; 

--------------------------------------------------------------------------------------

FUNCTION Calculer_Empreinte(Mdp : IN T_Mdp) RETURN Natural IS
   Empreinte : Natural := 0;
BEGIN
   FOR I IN 1 .. Mdp'Length LOOP
      -- Vérifier si le caractère est valide
      IF Mdp(I) IN ' '..'~' THEN -- Plage ASCII imprimable
         Empreinte := Empreinte + Character'Pos(Mdp(I)) * I;
      ELSE
         -- Ignorer ou gérer les caractères non valides
         NULL;
      END IF;
   END LOOP;
   RETURN Empreinte MOD 2048;
EXCEPTION
   WHEN OTHERS =>
      Put_Line("Erreur lors du calcul de l'empreinte.");
      RETURN 0;
END Calculer_Empreinte;

----------------------------------------------------------------------------------------


END gestion_outils;
