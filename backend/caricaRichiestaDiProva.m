function [esperimento,variabile,startYear,endYear,modello] = caricaRichiestaDiProva()

%experiments = ["ssp1_1_9", "ssp1_2_6", "ssp2_4_5", "ssp3_7_0", "ssp4_3_4", "ssp4_6_0", "ssp5_3_4os", "ssp5_8_5"];
%variables   = ["snow_depth","snowfall_flux","surface_snow_amount"];

%Cambia richiesta qui
query = 6;

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
        %Modello IPSL-CM6A-LR (France) non contiene dati
        %Modello MPI-ESM1-2-LR (Germany) non contiene dati
        %Modello NorESM2-MM (Norway) con esp = 8, var = 3 fallisce anche sul sito
        %Modello NorESM2-LM (Norway) con esp = 8, var = 3 fallisce anche sul sito
        %Modello CMCC-ESM2 (Italy) con esp = 8, var = 1 scambia il mese di Aprile con Novembre ma converte correttamente gli altri
        %Modello CMCC-ESM2 (Italy) con esp = 8, var = 3 non contiene dati
        %Modello CMCC-CM2-SR5 (Italy) con esp = 8, var = 1 scambia il mese di Aprile con Novembre ma converte correttamente gli altri
        esperimento = 8;
        variabile = 1;
        startYear = 2015;
        endYear = 2022;
        modello = 4;   
    case 4
        %Modello IPSL-CM5A2-INCA (France) non contiene dati
        %Modello AWI-CM-1-1-MR (Germany) scambia il mese di Aprile con Novembre ma converte correttamente gli altri
        esperimento = 2;
        variabile = 1;
        startYear = 2015;
        endYear = 2022;
        modello = 13; 
     case 5
        %Modello HadGEM3-GC31-LL (UK) non convertre correttamente le date
        %Modello MPI-ESM-1-2-HAM (Switzerland) non contiene dati
        esperimento = 4;
        variabile = 3;
        startYear = 2015;
        endYear = 2022;
        modello = 7; 
      case 6
        esperimento = 6;
        variabile = 2;
        startYear = 2015;
        endYear = 2022;
        modello = 2;  
end

end

