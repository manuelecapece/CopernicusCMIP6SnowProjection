function [variabile,modelsAvaible] = selezionaVariabile(experiment,sceltaVariabile)
%Restituisce la variabile selezionata dall'utente e la
%lista di modelli disponibili per la selezione

variables = ["snow_depth","snowfall_flux","surface_snow_amount"];

if(sceltaVariabile < 1 || sceltaVariabile > 3)
    error("Scelta variabile non valida");
end

variabile = variables(sceltaVariabile);

m = Modelli;

%SSP1-1.9
dizionarioModelli.ssp1_1_9_snowfall_flux       = [m.europa2, m.europa3, m.europa5, m.francia2, m.francia4];
dizionarioModelli.ssp1_1_9_surface_snow_amount = [m.europa2, m.europa3, m.europa5, m.francia2];
dizionarioModelli.ssp1_1_9_snow_depth          = [m.europa2, m.europa3, m.europa5, m.francia2];
%SSP1-2.6
dizionarioModelli.ssp1_2_6_snowfall_flux       = [m.europa5, m.francia1, m.francia2, m.francia3, m.francia4, m.francia5, m.italia1 ,m.italia2, m.germania1, m.germania2, m.norvegia1, m.norvegia2, m.inghilterra1, m.inghilterra2];
dizionarioModelli.ssp1_2_6_surface_snow_amount = [m.europa5, m.francia2, m.germania2, m.norvegia1, m.norvegia2];
dizionarioModelli.ssp1_2_6_snow_depth          = [m.europa5, m.francia2, m.italia1 ,m.italia2, m.norvegia1, m.norvegia2];
%SSP2-4.5
dizionarioModelli.ssp2_4_5_snowfall_flux       = [m.europa4, m.europa5, m.francia1, m.francia2, m.francia3, m.francia4, m.italia1, m.italia2, m.germania1, m.germania2, m.norvegia1, m.norvegia2, m.inghilterra1];
dizionarioModelli.ssp2_4_5_surface_snow_amount = [m.europa4, m.europa5, m.francia2, m.germania2, m.norvegia1, m.norvegia2];
dizionarioModelli.ssp2_4_5_snow_depth          = [m.europa4, m.europa5, m.francia2, m.italia1, m.italia2, m.norvegia1, m.norvegia2];
%SSP3-7.0
dizionarioModelli.ssp3_7_0_snowfall_flux       = [m.europa1, m.europa5, m.francia1, m.francia2, m.francia3, m.francia4, m.francia5, m.italia2, m.germania1, m.germania2, m.norvegia1, m.norvegia2, m.svizzera1];
dizionarioModelli.ssp3_7_0_surface_snow_amount = [m.europa1, m.europa5, m.francia2 m.germania2, m.norvegia1, m.norvegia2, m.svizzera1];
dizionarioModelli.ssp3_7_0_snow_depth          = [m.europa1, m.europa5, m.francia2, m.italia2, m.norvegia1, m.norvegia2];
%SSP4-3.4
dizionarioModelli.ssp4_3_4_snowfall_flux       = [m.europa3, m.francia2, m.francia4];
dizionarioModelli.ssp4_3_4_surface_snow_amount = [m.europa3, m.francia2];
dizionarioModelli.ssp4_3_4_snow_depth          = [m.francia2];
%SSP4-6.0
dizionarioModelli.ssp4_6_0_snowfall_flux       = [m.francia2, m.francia4];
dizionarioModelli.ssp4_6_0_surface_snow_amount = [m.francia2];
dizionarioModelli.ssp4_6_0_snow_depth          = [m.francia2];
%SSP5-3.4OS
dizionarioModelli.ssp5_3_4os_snowfall_flux       = [m.europa3, m.francia2, m.francia4];
dizionarioModelli.ssp5_3_4os_surface_snow_amount = [m.europa3, m.francia2];
dizionarioModelli.ssp5_3_4os_snow_depth          = [m.francia2];
%SSP5-8.5
dizionarioModelli.ssp5_8_5_snowfall_flux       = [m.europa4, m.europa5, m.francia1, m.francia2, m.francia3, m.francia4, m.italia1, m.italia2, m.germania1, m.germania2, m.norvegia1, m.norvegia2, m.inghilterra1, m.inghilterra2];
dizionarioModelli.ssp5_8_5_surface_snow_amount = [m.europa4, m.europa5, m.francia2, m.germania2, m.norvegia1, m.norvegia2];
dizionarioModelli.ssp5_8_5_snow_depth          = [m.europa4, m.europa5, m.francia2, m.italia1, m.italia2, m.norvegia1, m.norvegia2];

switch experiment
    case "ssp1_1_9"
        switch variabile
            case "snow_depth"
                modelsAvaible = dizionarioModelli.ssp1_1_9_snow_depth;
            case "snowfall_flux"
                modelsAvaible = dizionarioModelli.ssp1_1_9_snowfall_flux;
            case "surface_snow_amount"
                modelsAvaible = dizionarioModelli.ssp1_1_9_surface_snow_amount;
        end
    case "ssp1_2_6"
        switch variabile
            case "snow_depth"
                modelsAvaible = dizionarioModelli.ssp1_2_6_snow_depth;
            case "snowfall_flux"
                modelsAvaible = dizionarioModelli.ssp1_2_6_snowfall_flux;
            case "surface_snow_amount"
                modelsAvaible = dizionarioModelli.ssp1_2_6_surface_snow_amount;
        end
    case "ssp4_3_4"
        switch variabile
            case "snow_depth"
                modelsAvaible = dizionarioModelli.ssp4_3_4_snow_depth;
            case "snowfall_flux"
                modelsAvaible = dizionarioModelli.ssp4_3_4_snowfall_flux;
            case "surface_snow_amount"
                modelsAvaible = dizionarioModelli.ssp4_3_4_surface_snow_amount;
        end
    case "ssp5_3_4os"
        switch variabile
            case "snow_depth"
                modelsAvaible = dizionarioModelli.ssp5_3_4os_snow_depth;
            case "snowfall_flux"
                modelsAvaible = dizionarioModelli.ssp5_3_4os_snowfall_flux;
            case "surface_snow_amount"
                modelsAvaible = dizionarioModelli.ssp5_3_4os_surface_snow_amount;
        end
    case "ssp2_4_5"
        switch variabile
            case "snow_depth"
                modelsAvaible = dizionarioModelli.ssp2_4_5_snow_depth;
            case "snowfall_flux"
                modelsAvaible = dizionarioModelli.ssp2_4_5_snowfall_flux;
            case "surface_snow_amount"
                modelsAvaible = dizionarioModelli.ssp2_4_5_surface_snow_amount;
        end
    case "ssp4_6_0"
        switch variabile
            case "snow_depth"
                modelsAvaible = dizionarioModelli.ssp4_6_0_snow_depth;
            case "snowfall_flux"
                modelsAvaible = dizionarioModelli.ssp4_6_0_snowfall_flux;
            case "surface_snow_amount"
                modelsAvaible = dizionarioModelli.ssp4_6_0_surface_snow_amount;
        end
    case "ssp3_7_0"
        switch variabile
            case "snow_depth"
                modelsAvaible = dizionarioModelli.ssp3_7_0_snow_depth;
            case "snowfall_flux"
                modelsAvaible = dizionarioModelli.ssp3_7_0_snowfall_flux;
            case "surface_snow_amount"
                modelsAvaible = dizionarioModelli.ssp3_7_0_surface_snow_amount;
        end
    case "ssp5_8_5"
        
end

end

