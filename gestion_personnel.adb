WITH Ada.Text_IO, Ada.Integer_Text_IO, Ada.Characters.Handling, gestion_outils,gestion_personnel;
USE Ada.Text_IO, Ada.Integer_Text_IO, Ada.Characters.Handling, gestion_outils, gestion_personnel;
PACKAGE BODY gestion_personnel IS

PROCEDURE Visu_Pers (Pers : IN T_personnel) IS
BEGIN
    Affiche_Identite(Pers.identite);
  	New_Line;
  	Put("fonction: ");
 	put(T_fonction'image(pers.fonction));
    new_line;
  	Put("nom de jeune fille de la mere : ");
  	Put(Pers.nom_jfm_pers(1..Pers.k_nom_jfm));
  	New_Line;
  	Put("login :");
  	Put(Pers.login_pers.titre(1..Pers.login_pers.k_titre));
  	new_line;
END Visu_Pers;

----------------------------------------------------------------------------

PROCEDURE Saisie_Personne (Pers : OUT T_Personnel) IS
      S : String (1..20);
      K : integer ;
      mdp : T_mdp;
 BEGIN
    Put("Identite :");
    Saisie_identite(Pers.Identite);
    pers.login_pers := Creation_Login(pers.identite);
    Put("nom de jeune fille de la mere :");
    Saisie_mot(Pers.nom_jfm_pers,Pers.k_nom_jfm);
    put("mdp: ");
    Saisie_Mdp(mdp);
    pers.empreinte_pers := Calculer_Empreinte(mdp);
    LOOP
    BEGIN
        put_line("fonction :");
        Get_Line(S,K);
        Pers.fonction := T_fonction'Value(S(1..K));
        EXIT;
        EXCEPTION
        WHEN Constraint_Error => Put_Line("ce metier n'est pas pris en compte");
    END;
    END LOOP;
END Saisie_Personne;
---------------------------------------------------------------------------
FUNCTION Creation_login (identite: T_identite ) RETURN T_titre is
login: T_titre;
begin
Login.titre(1..identite.k_nom):= identite.Nom(1..identite.k_nom);
Login.titre(Identite.k_nom+1):='_';
Login.titre(identite.k_nom+2..identite.K_nom+1+Identite.k_prenom):=Identite.prenom(1..Identite.K_prenom);
Login.k_titre:=Identite.k_nom+1+Identite.k_prenom;
RETURN(login);
END Creation_Login; 


end gestion_personnel;



