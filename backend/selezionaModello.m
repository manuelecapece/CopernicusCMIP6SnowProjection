function [model_nameQuery] = selezionaModello(modelsAvaible,scelta)
%Restituisce il nome del modello selezionato tra quelli disponibili

if(scelta < 1 || scelta > size(modelsAvaible,2))
    error('Scelta del modello non valida');
end

model = modelsAvaible(scelta);

switch model

    case "EC-Earth3 (Europe)"
        model_nameQuery = 'ec_earth3';
    case "EC-Earth3-CC (Europe)"
        model_nameQuery = 'ec_earth3_cc';
    case "EC-Earth3-Veg (Europe)"
        model_nameQuery ='ec_earth3_veg' ;
    case "EC-Earth3-Veg-LR (Europe)"
        model_nameQuery = 'ec_earth3_veg_lr';
    case "EC-Earth3-AerChem (Europe)"
        model_nameQuery = 'ec_earth3_aerchem';

    case "CMCC-CM2-SR5 (Italy)"
        model_nameQuery = 'cmcc_cm2_sr5';
    case "CMCC-ESM2 (Italy)"
        model_nameQuery = 'cmcc_esm2';  

    case "CNRM-ESM2-1 (France)"
        model_nameQuery = 'cnrm_esm2_1';
    case "CNRM-CM6-1 (France)"
        model_nameQuery = 'cnrm_cm6_1';
    case "CNRM-CM6-1-HR (France)"
        model_nameQuery = 'cnrm_cm6_1_hr';
    case "IPSL-CM6A-LR (France)"
        model_nameQuery = 'ipsl_cm6a_lr'; 
    case "IPSL-CM5A2-INCA (France)"
        model_nameQuery = 'ipsl_cm5a2_inca'; 

    case "HadGEM3-GC31-MM (UK)"
        model_nameQuery = 'hadgem3_gc31_mm';
    case "HadGEM3-GC31-LL (UK)"
        model_nameQuery = 'hadgem3_gc31_ll';

end

end

