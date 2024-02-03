clc;
clear all;
close all;
%% Richiesta API modello projections-cmip6

%TODO passaggio KEY user -> non possibile, meglio inserire la chiave alla
%prima esecuzione e poi l'app creerà il file .cdsapirc e lo inserira nel
%path %HOMEPATH%

%Migliora plot grafico, prova line plot con interpolazione spline di grado alto
% aggiungi {} agli esponenti

% % Query di esempio 1
% esperimento = 4;
% startYear = 2015;
% endYear = 2100;
% variabile = 3;
% modello = 3;

% % Query di esempio 2
% esperimento = 3;
% startYear = 2015;
% endYear = 2022;
% variabile = 2;
% modello = 1;

esperimento = 3;
startYear = 2015;
endYear = 2022;
variabile = 3;
modello = 3;

%Seleziona esperimento e asse dei tempi
[experiment,year] = selezionaParametri(esperimento,startYear,endYear);
fprintf('Parametri selezionati:\n\tEsperimento: %s \n\tAnno inizio: %s \n\tAnno fine: %s\n', experiment, num2str(year(1)), num2str(year(end)));
disp(newline)

%Seleziona variabile
[variable,models] = selezionaVariabile(experiment,variabile);
fprintf('Variabile selezionata: \n\t%s\n', variable);
disp(newline)

disp('Lista dei modelli disponibili per i parametri selezionati:');
fprintf('\t%s\n', models{:});
disp(newline)

%Seleziona modello
[model] = selezionaModello(models,modello);
disp(['Modello selezionato: ',model])
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

plotDati(snow_basilicata,variable,T)

