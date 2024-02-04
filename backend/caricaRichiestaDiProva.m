function [esperimento,variabile,startYear,endYear,modello] = caricaRichiestaDiProva()

%experiments = ["ssp1_1_9", "ssp1_2_6", "ssp2_4_5", "ssp3_7_0", "ssp4_3_4", "ssp4_6_0", "ssp5_3_4os", "ssp5_8_5"];
%variables   = ["snow_depth","snowfall_flux","surface_snow_amount"];

%Cambia richiesta qui
query = 1;

switch query
    case 1
        esperimento = 4;
        variabile = 3;
        startYear = 2015;
        endYear = 2100;
        modello = 2;
    case 2
        esperimento = 3;
        variabile = 2;
        startYear = 2015;
        endYear = 2022;
        modello = 1;
    case 3
        %Genera eccezione, modello = IPSL-CM6A-LR (France)
        esperimento = 8;
        variabile = 3;
        startYear = 2015;
        endYear = 2100;
        modello = 3;       
end

end

