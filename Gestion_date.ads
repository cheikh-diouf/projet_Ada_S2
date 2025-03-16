with 
use

 package gestion_dates is 

    subtype T_int_mois is integer range 1..12; 
    subtype T_int_jour is integer range 1..31; 
    type t_date is record 
        jour: T_int_jour; 
        mois: T_int_mois; 
        annee: natural; 
    end record;
 end gestion_dates;