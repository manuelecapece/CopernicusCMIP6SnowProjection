function [experiment,variable,year,modelsAvaible] = selezionaParametri(sceltaEsperimento,sceltaVariabile,yearStart,yearEnd)
%Restituisce l'esperimento e la variabile selezionata dall'utente e la
%lista di modelli disponibili per la selezione

experiments = ["ssp1_1_9", "ssp1_2_6", "ssp2_4_5", "ssp3_7_0", "ssp4_3_4", "ssp4_6_0", "ssp5_3_4os", "ssp5_8_5"];
variable = ["snow_depth","snowfall_flux","surface_snow_amount"];

if(sceltaEsperimento < 1 || sceltaEsperimento > 8)
    error("Scelta esperimento non valida");
end
if(sceltaVariabile < 1 || sceltaVariabile > 3)
    error("Scelta variabile non valida");
end
if(yearStart < 2015 || yearStart > 2099)
    error("Anno di inizio non valido");
end
if(yearEnd < 2016 || yearEnd > 2100)
    error("Anno di fine non valido");
end

experiment = experiments(sceltaEsperimento);
variable = variable(sceltaVariabile);
year = creaStringaAnni(yearStart,yearEnd);

dizionarioModelli.ssp1_1_9_name   = ["EC-Earth3 (Europe)" , "EC-Earth3-Veg (Europe)" , "EC-Earth3-Veg-LR (Europe)" , "CNRM-ESM2-1 (France)" , "IPSL-CM6A-LR (France)"];
dizionarioModelli.ssp1_2_6_name   = ["CNRM-CM6-1-HR (France)" , "CMCC-CM2-SR5 (Italy)" , "CMCC-ESM2 (Italy)", "HadGEM3-GC31-MM (UK)"];
dizionarioModelli.ssp4_3_4_name   = ["EC-Earth3 (Europe)" , "CNRM-ESM2-1 (France)" , "IPSL-CM6A-LR (France)"];
dizionarioModelli.ssp5_3_4os_name = ["EC-Earth3 (Europe)" , "CNRM-ESM2-1 (France)", "IPSL-CM6A-LR (France)"];
dizionarioModelli.ssp2_4_5_name   = ["EC-Earth3-CC (Europe)" , "CNRM-CM6-1-HR (France)" , "CMCC-CM2-SR5 (Italy)" , "CMCC-ESM2 (Italy)" , "HadGEM3-GC31-LL (UK)"];
dizionarioModelli.ssp4_6_0_name   = ["CNRM-ESM2-1 (France)" , "IPSL-CM6A-LR (France)"];
dizionarioModelli.ssp3_7_0_name   = ["EC-Earth3-AerChem (Europe)" , "EC-Earth3-Veg-LR (Europe)" , "CNRM-CM6-1 (France)" , "CNRM-CM6-1-HR (France)" , "IPSL-CM5A2-INCA (France)" , "IPSL-CM6A-LR (France)" , "CMCC-CM2-SR5 (Italy)"];
dizionarioModelli.ssp5_8_5_name   = ["EC-Earth3-CC (Europe)" , "EC-Earth3-Veg-LR (Europe)" , "CNRM-CM6-1 (France)" , "CNRM-CM6-1-HR (France)" , "CNRM-ESM2-1 (France)" , "IPSL-CM6A-LR (France)" , "CMCC-CM2-SR5 (Italy)" , "CMCC-ESM2 (Italy)" , "HadGEM3-GC31-LL (UK)","HadGEM3-GC31-MM (UK)"];

switch experiment
    case "ssp1_1_9"
        modelsAvaible = dizionarioModelli.ssp1_1_9_name;
    case "ssp1_2_6"
        modelsAvaible = dizionarioModelli.ssp1_2_6_name;
    case "ssp4_3_4"
        modelsAvaible = dizionarioModelli.ssp4_3_4_name;
    case "ssp5_3_4os"
        modelsAvaible = dizionarioModelli.ssp5_3_4os_name;
    case "ssp2_4_5"
        modelsAvaible = dizionarioModelli.ssp2_4_5_name;
    case "ssp4_6_0"
        modelsAvaible = dizionarioModelli.ssp4_6_0_name;
    case "ssp3_7_0"
        modelsAvaible = dizionarioModelli.ssp3_7_0_name;
    case "ssp5_8_5"
        modelsAvaible = dizionarioModelli.ssp5_8_5_name;
end

end

