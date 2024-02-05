clc;
clear variables;
close all;
%% Richiesta API modello projections-cmip6

%Cerca metodo per bloccare la richiesta

%Fai versione grafico con sublpot grafico ad area e grafico a barre

%Carica parametri richiesta di prova
[esperimento,variabile,startYear,endYear,modello] = caricaRichiestaDiProva();

%Seleziona parametri: esperimento,variabile e asse dei tempi
[experiment, variable, years_string, models] = selezionaParametri(esperimento,variabile,startYear,endYear);
fprintf('Parametri selezionati:\n\tEsperimento: %s \n\tVariabile: %s \n\tAnno inizio: %s \n\tAnno fine: %s\n', experiment, variable, num2str(years_string(1)), num2str(years_string(end)));
disp(newline)

if(isempty(models))
    disp('Non ci sono modelli disponibili per i parametri selezionati');
    return;
end

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

