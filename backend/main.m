clc;
clear all;
close all;
%% Richiesta API modello projections-cmip6

%TODO passaggio KEY user -> non possibile, meglio inserire la chiave alla
%prima esecuzione e poi l'app creerà il file .cdsapirc e lo inserira nel
%path %HOMEPATH%

%sistema stampa ora e data creazione log richiesta

%TODO Migliora plot grafico, prova line plot con interpolazione spline di grado alto


%Carica parametri richiesta di prova
[esperimento,variabile,startYear,endYear,modello] = caricaRichiestaDiProva();

%Seleziona parametri: esperimento,variabile e asse dei tempi
[experiment, variable, year, models] = selezionaParametri(esperimento,variabile,startYear,endYear);
fprintf('Parametri selezionati:\n\tEsperimento: %s \n\tVariabile: %s \n\tAnno inizio: %s \n\tAnno fine: %s\n', experiment, variable, num2str(year(1)), num2str(year(end)));
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
disp('*               Richiesta in corso, attendere la risposta del server...                     *')
disp(newline)
[pathDataset,F] = makeRequest(experiment,variable,model,year);
disp(newline)
fprintf('Percorso dataset netCDF scaricato: \n\t%s\n', pathDataset);
disp(newline)
disp('*                            Richiesta completata!                                          *')
disp('*********************************************************************************************')
disp(newline)

%% Elaborazione dei dati

%Lettura dati
[time,lat,lon,snw] = leggiDati(pathDataset);
dim = size(snw);
fprintf('Dimensioni matrice snw: \nLatitudini: %s, Longitudini: %s, Time: %s\n', num2str(dim(1)), num2str(dim(2)), num2str(dim(3)));

%Conversione delle date
T = convertiDate(time);

%Filtraggio dei dati sulle coordinate geografiche della Basilicata
[snow_basilicata] = filtraDati(lat,lon,snw);

%% Plotting dati

plotDati(snow_basilicata,variable,T,time,year)

