function [esperimento,variabile,startYear,endYear,modello] = caricaRichiestaDiProva()

%experiments = ["ssp1_1_9", "ssp1_2_6", "ssp2_4_5", "ssp3_7_0", "ssp4_3_4", "ssp4_6_0", "ssp5_3_4os", "ssp5_8_5"];
%variables   = ["snow_depth","snowfall_flux","surface_snow_amount"];

%Cambia richiesta qui
query = 9;

switch query
    case 1
        %Test modelli EU - OK ma in alucuni casi sembrano essere lenti
        %Anomalie:
        %Richieste da segnalare:
        %   ssp1_1_9,snowfall_flux,2025,2060,ec_earth3_veg ci mette 30 anni
        esperimento = 3;
        variabile = 1;
        startYear = 2025;
        endYear = 2060;
        modello = 1;
    case 2
        %Modelli Francesi - OK 
        %Anomalie: non ci sono modelli Francesi per la
        %          varibile snow_depth e surface_snow_amount
        esperimento = 8;
        variabile = 3;
        startYear = 2015;
        endYear = 2022;
        modello = 51;
    case 3
        %Test modelli ITALIANI - OK
        %Anomalie: non ci sono modelli italiani per la
        %          varibile surface_snow_amount
        esperimento = 8;
        variabile = 3;
        startYear = 2024;
        endYear = 2030;
        modello = 57; 
     case 4
        %Test modelli TEDESCHI - OK
        %Anomalie: non ci sono modelli tedeschi per la
        %          variabile snow_depth e surface_snow_amount
        esperimento = 8;
        variabile = 3;
        startYear = 2024;
        endYear = 2030;
        modello = 60; 
     case 5
        %Test modelli NORVEGESI - OK
        %Anomalie: i modelli norvegesi per la variabile
        %          surface_snow_amount restituiscono 0. Disabilitati
        esperimento = 2;
        variabile = 3;
        startYear = 2024;
        endYear = 2030;
        modello = 2;
      case 6
        %Test modelli INGLESI - OK
        %Anomalie: non ci sono modelli inglesi per la
        %          variabile snow_depth e surface_snow_amount
        esperimento = 8;
        variabile = 3;
        startYear = 2024;
        endYear = 2040;
        modello = 100;
    %Richieste varie non problematiche
    case 7
        esperimento = 4;
        variabile = 3;
        startYear = 2015;
        endYear = 2100;
        modello = 2;
    case 8
        esperimento = 3;
        variabile = 2;
        startYear = 2015;
        endYear = 2022;
        modello = 1;
    case 9
        esperimento = 4;
        variabile = 2;
        startYear = 2024;
        endYear = 2056;
        modello = 8;
end

end

