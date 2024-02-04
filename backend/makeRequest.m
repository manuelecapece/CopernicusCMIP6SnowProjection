function [pathDataset,F] = makeRequest(experiment,variable,model,year)
%Effettua la richiesta API, restituisce la struttura contentente le opzioni 
%della richiesta API e il path del dataset netCDF

cd('dataset\')

datasetName = "projections-cmip6";
datasetOptions.temporal_resolution = "monthly";
datasetOptions.month  = ["01", "02", "03","04","12"]; %Da Dicembre a Aprile

datasetOptions.experiment  = experiment;
datasetOptions.variable  = variable;
datasetOptions.model  = model;
datasetOptions.year = year; 

F = climateDataStoreDownloadAsync(datasetName,datasetOptions);

disp(newline)
dataCreazione = datetime(F.CreateDateTime,'Format','yyyy-MM-dd hh:mm:ss');
fprintf('Data e ora di creazione: %s\n', dataCreazione);

disp('.')
disp('.')
disp('.')

stato = '';
while (F.State ~= 'completed')
    if(stato ~= F.State)
        disp(['Stato richiesta: ', num2str(F.State)]);
        stato = F.State;
    end
    if(F.State == 'failed')
        break
    end
end

F.wait();

if(F.State == 'failed')
        cd('..\')
        error('Richiesta fallita');
end

if F.State == "completed"
    downloadedFilePaths = F.OutputArguments{1};
    citation = F.OutputArguments{2};
end

dataFine = datetime(F.FinishDateTime,'Format','yyyy-MM-dd hh:mm:ss');
fprintf('Data e ora di fine: %s\n', dataFine);
fprintf('Tempo di esecuzione : %s\n',  dataFine - dataCreazione);

cd('..\')

pathDataset = strcat('dataset/',downloadedFilePaths(1));
pathJson = strcat('dataset/',downloadedFilePaths(2));
pathPNG = strcat('dataset/',downloadedFilePaths(3));


end
