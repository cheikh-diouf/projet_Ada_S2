WITH Ada.Text_IO, Ada.Integer_Text_IO, Ada.Characters.Handling;
USE Ada.Text_IO, Ada.Integer_Text_IO, Ada.Characters.Handling;
PACKAGE BODY gestion_personnel IS

PROCEDURE Visu_Pers (Pers : IN T_personnel) IS
BEGIN
    Put("identite : ");
    Affiche_Identite(Pers.identité);
  	New_Line;
  	Put("fonction: ");
 	put(T_fonction'image(pers.fonction));
  	Put("nom de jeune fille de la mère : ");
  	Put(Pers.nom_jfm_pers);
  	New_Line;
  	Put("login :");
  	Put(Pers.Login);
  	new_line;
END Visu_Pers;

----------------------------------------------------------------------------

PROCEDURE Saisie_Personne (Pers : OUT T_Personnel) IS
      S : String (1..20);
      K : integer ;
 BEGIN
    Put("Identité :");
    Saisie_identite(Pers.Identité);
    Put("nom de jeune fille de la mère :");
    Saisie_mot(Pers.nom_jfm_pers);

    LOOP
    BEGIN
        put_line("fonction ? :");
        Get_Line(S,K);
        Pers.fonction := T_fonction'Value(S(1..K));
        EXIT;
        EXCEPTION
        WHEN Constraint_Error => Put_Line("ce metier n'est pas pas pris en compte");
    END;
    END LOOP;
END Saisie_Personne;

end gestion_personnel;



