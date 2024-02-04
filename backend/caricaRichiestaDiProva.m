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
        %Test modellli
        %Modello IPSL-CM6A-LR (France) non contiene dati
        %Modello MPI-ESM1-2-LR (Germany) non contiene dati
        %Modello NorESM2-MM (Norway) con esp = 8, var = 3 fallisce anche sul sito
        %Modello NorESM2-LM (Norway) con esp = 8, var = 3 fallisce anche sul sito
        esperimento = 8;
        variabile = 1;
        startYear = 2015;
        endYear = 2022;
        modello = 5;   
    case 4
        %Test esperimenti
        %Esperimento ssp4_6_0 con modello 1 e variabile 1 non contiene dati
        %Esperimento ssp4_6_0 con modello 1 e 2 e variabile 2 fallisce 
        %Esperimento ssp4_6_0 con modello 1 e variabile 3 non contiene dati
        esperimento = 6;
        variabile = 2; 
        startYear = 2015;
        endYear = 2050;
        modello = 2;   
    case 5
        %Esperimento SSP5-3.4OS dispone di anni solo da 2040 al 2100
        esperimento = 7;
        variabile = 3;
        startYear = 2015;
        endYear = 2050;
        modello = 1;   
end

end

