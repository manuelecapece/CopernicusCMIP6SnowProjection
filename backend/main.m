clc;
clear all;
close all;
%% Richiesta API modello projections-cmip6

%TODO inserisci file .cdsapirc in c:/Users/user, gestisci passaggio
%Migliora plot grafico, prova line plot con interpolazione spline di grado alto
%TODO inserisci tutti gli altri modelli europei, germania ecc

% % Query di esempio 1
% experiment = "ssp2_4_5"; %=3
% variable  = "snowfall_flux"; %=2
% model  = "ec_earth3_cc"; %=1
% startYear = 2015;
% endYear = 2022;

%Seleziona parametri
[experiment,variable,year,models] = selezionaParametri(4,3,2015,2100);
fprintf('Parametri selezionati:\nEsperimento: %s \nVariabile: %s \nAnno inizio: %s \nAnno fine: %s\n', experiment, variable, num2str(year(1)), num2str(year(end)));
disp('Lista dei modelli disponibili per il parametro selezionato:');
disp(models);

%Seleziona modello
[model] = selezionaModello(models,1);
disp(['Modello selezionato: ',model])
disp(newline)

%Effettua la richiesta
disp('Richiesta in corso, attendere la risposta del server...')
[pathDataset] = makeRequest(experiment,variable,model,year);
disp('Richiesta completata!')
disp(newline)

fprintf('%s\n%s\n','Percorso dataset netCDF scaricato',pathDataset)
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

plotDati(snow_basilicata,variable,T)

