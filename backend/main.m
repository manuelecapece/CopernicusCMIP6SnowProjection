clc;
clear variables;
close all;
%% Richiesta API modello projections-cmip6

%TODO passaggio KEY user -> non possibile, meglio inserire la chiave alla
%prima esecuzione e poi l'app creerà il file .cdsapirc e lo inserira nel
%path %HOMEPATH%

%Gestisci questione snw diversa a seconda variabile

%Gestisci flusso di esecuzione con modelli disabilitati

%Modelli con problemi di conversione delle date: Italia, Norvegia, Germany, UK

%Problemi Norvegia
%     modello NorESM2-LM (Norway) non contiene dati
%     modello NorESM2-MM (Norway) con variabile surface_snow_amount contiene solo 0 per la basilicata
% Elimina NorESM2-LM (Norway)
% Disabilita surface_snow_amount per Norvegia


%Carica parametri richiesta di prova
[esperimento,variabile,startYear,endYear,modello] = caricaRichiestaDiProva();

%Seleziona parametri: esperimento,variabile e asse dei tempi
[experiment, variable, years_string, models] = selezionaParametri(esperimento,variabile,startYear,endYear);
fprintf('Parametri selezionati:\n\tEsperimento: %s \n\tVariabile: %s \n\tAnno inizio: %s \n\tAnno fine: %s\n', experiment, variable, num2str(years_string(1)), num2str(years_string(end)));
disp(newline)

disp('Lista dei modelli disponibili per i parametri selezionati:');
fprintf('\t%s\n', models{:});
disp(newline)

%Seleziona modello
[model] = selezionaModello(models,modello);
fprintf('Modello selezionato: \n\t%s\n', model);
disp(newline)

%Effettua la richiesta
disp('*********************************************************************************************')
disp('*                  Richiesta in corso, attendere la risposta del server...                  *')
disp(newline)
[pathDataset,F] = makeRequest(experiment,variable,model,years_string);
disp(newline)
fprintf('Percorso dataset netCDF scaricato: \n\t%s\n', pathDataset);
disp(newline)
disp('*                               Richiesta completata!                                       *')
disp('*********************************************************************************************')
disp(newline)

%% Elaborazione dei dati

%Lettura dati
disp('*****************************************************')
disp('*                  Import dei dati                  *')
[time,lat,lon,snw] = leggiDati(pathDataset);
disp('*****************************************************')
disp(newline)
dim = size(snw);
fprintf('Dimensioni matrice snw: \nLatitudini: %s, Longitudini: %s, Time: %s\n', num2str(dim(1)), num2str(dim(2)), num2str(dim(3)));

%Filtraggio dei dati sulle coordinate geografiche della Basilicata
[snow_basilicata] = filtraDati(lat,lon,snw);

%% Plotting dati

plotDati(snow_basilicata,variable,time,years_string)

