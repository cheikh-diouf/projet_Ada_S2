WITH Ada.Text_IO,
   Ada.Integer_Text_IO,
   Ada.Characters.Handling;
USE Ada.Text_IO,
   Ada.Integer_Text_IO,
   Ada.Characters.Handling;
PACKAGE BODY gestion_date IS

----------------------------------------------------------------------
   --fonction qui donne l'annee
   FUNCTION Bissextile (
         Annee : Natural)
     RETURN Boolean IS-- true si l'année est bissextile
      Bis : Boolean;
   BEGIN
      IF (Annee mod 4 =0 ) AND ((Annee mod 400=0) OR (Annee mod 100/=0)) THEN
         Bis:=True;
      ELSE
         Bis:= False;
      END IF;
      RETURN (Bis);
   END Bissextile;

--------------------------------------------------------------------------
   -- Fontion qui donne le jour en fonction du mois
   FUNCTION Nombre_Jour (
         Mois  : T_mois;
         Annee : Natural)
     RETURN Integer IS
      Nbj : Integer;
   BEGIN
      CASE Mois IS
         WHEN avril|juin|septembre|novembre =>
            NbJ:= 30;
         WHEN fevrier =>
            IF Bissextile(Annee) THEN
               NbJ:= 29;
            ELSE
               NbJ:=28;
            END IF;
         WHEN OTHERS =>
            NbJ:= 31;
      END CASE;
      RETURN Nbj;
   END Nombre_Jour;
-----------------------------------------------------------------------------

FUNCTION Date_Correcte (D : T_date) RETURN Boolean IS
   Correcte : Boolean;
BEGIN
   Correcte:=D.Jour<=Nb_Jours(Date);
   RETURN Correcte;
END Date_Correcte;


-----------------------------------------------------------------------------

   -- Procedure qui permet de saisir une date
   PROCEDURE Saisie_Date (
         D :    OUT T_Date) IS
   S : String (1 .. 20);
   K : Integer;

   BEGIN
      Put_Line("donner une date");

      LOOP
         BEGIN
            Put("donnez le jour");
            Get(D.Jour);
            Skip_Line;
            EXIT;
         EXCEPTION
            WHEN Data_Error|Constraint_Error =>
               Skip_Line;
               Put_Line("erreur, recommenez donner un jour");
         END;
      END LOOP;

      LOOP
         BEGIN
            Put_Line("donnez le mois");
            Get_Line(S,K);
            D.Mois:= T_mois'Value(S(1..K));
            EXIT;
         EXCEPTION
            WHEN Data_Error|Constraint_Error =>
               Put_Line("erreur, recommenez donner un mois");
         END;
      END LOOP;

      LOOP
         BEGIN
            Put_Line("Donnez l'annee");
            Get(D.Annee);
            Skip_Line;
            EXIT WHEN D.Jour <= Nombre_Jour(D.Mois,D.Annee);
            put_line("Date non valide");
         EXCEPTION
            WHEN Data_Error|Constraint_Error =>
               Skip_Line;
               Put_Line("erreur, recommenez donner l'annee");
         END;
      END LOOP;

   END Saisie_Date;

----------------------------------------------------------------------------
   -- procedure qui affiche une date
   PROCEDURE Affichage_Date (
         D : IN     T_date) IS
   BEGIN
      Put(D.Jour);
      Put(T_mois'Image(D.Mois));
      Put(D.Annee);
   END Affichage_Date;

-------------------------------------------------------------------------

-- procedure qui passe au lendemain
   PROCEDURE Lendemain (
         D : IN OUT T_date) IS
      J_Max : Integer;
   BEGIN
      J_Max:=Nombre_Jour(D.mois, D.annee);
      IF D.Jour +1 > J_Max THEN
         D.Jour:= 1;
         IF T_mois'Last = D.mois THEN
            D.mois:= T_mois'First;
            D.annee:= D.annee+1;
         ELSE
            D.mois:=T_mois'Succ(D.mois);
         END IF;
      ELSE
         D.Jour:=D.Jour+1;
      END IF;

   END Lendemain;

END gestion_date;
