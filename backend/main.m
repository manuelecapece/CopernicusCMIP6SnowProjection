clc;
clear all;
close all;
%% Richiesta API modello projections-cmip6

% % Query di esempio 1
% experiment = "ssp2_4_5"; %=3
% variable  = "snowfall_flux"; %=2
% model  = "ec_earth3_cc"; %=1
% yearStart = 2015;
% yearEnd = 2022;

%Seleziona parametri
[experiment,variable,year,models] = selezionaParametri(3,2,2015,2022);
fprintf('Parametri selezionati:\nEsperimento: %s \nVariabile: %s \nAnno inizio: %s \nAnno fine: %s\n', experiment, variable, num2str(year(1)), num2str(year(end)));
disp('Lista dei modelli disponibili per il parametro selezionato:');
disp(models);

[model] = selezionaModello(models,1);
disp(['Modello selezionato: ',model])
disp(newline)

%Effettua la richiesta
disp('Richiesta in corso, attendere la risposta del server...')
[pathDataset] = makeRequest(experiment,variable,model,year);
disp('Richiesta completata!')

fprintf('%s\n%s\n','Percorso dataset netCDF scaricato',pathDataset)

%% Elaborazione dei dati

%Lettura dati
[time,lat,lon,snw] = leggiDati(pathDataset);
dim = size(snw);
fprintf('Dimensioni matrice snw: \nLatitudini: %s, Longitudini: %s, Time: %s\n', num2str(dim(1)), num2str(dim(2)), num2str(dim(3)));

%Conversione delle date
T = datetime(1850,1,1,'Format','MMM-yyyy') + days(time);

%Filtraggio dei dati sulle coordinate geografiche della Basilicata
[snw_bas] = filtraDati(lat,lon,snw);

%% Plottaggio dati
plotDati(snw,variable,T)

