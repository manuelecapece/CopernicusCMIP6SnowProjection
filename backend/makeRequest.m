function [pathDataset] = makeRequest(experiment,variable,model,year, isInApp, path1)
%Effettua la richiesta API, restituisce la struttura contentente le opzioni
%della richiesta API e il path del dataset netCDF

% Setto start year a 2016 se l'utente sceglie di partire dal 2015 con un modello Norvegese
m = Modelli;

if(strcmp(model,'noresm2_mm') || strcmp(model,'noresm2_lm'))
    if(year(1) == '2015')
        year = creaStringaAnni(2016 , str2num(year(end)));
    end
    if(year(end) == '2015')
        year = creaStringaAnni(2016 , 2016);
    end
end

if (~isInApp)
    cd('dataset\');
else
    cd(path1);
end

datasetName = "projections-cmip6";
datasetOptions.temporal_resolution = "monthly";
datasetOptions.month  = ["01", "02", "03", "04", "12"]; %Da Dicembre a Aprile

datasetOptions.experiment  = experiment;
datasetOptions.variable  = variable;
datasetOptions.model  = model;
datasetOptions.year = year;

clear global response;
global response;
response = climateDataStoreDownloadAsync(datasetName,datasetOptions);

if (~isInApp)
    dataCreazione = datetime(response.CreateDateTime,'Format','yyyy-MM-dd hh:mm:ss');
    fprintf('Data e ora di creazione: %s\n', dataCreazione);

    disp('.')
    disp('.')
    disp('.')

    stato = '';
    while (response.State ~= 'completed')
        if(stato ~= response.State)
            disp(['Stato richiesta: ', num2str(response.State)]);
            stato = response.State;
        end
        if(response.State == 'failed')
            break
        end
    end

    response.wait();

    if(response.State == 'failed')
        cd('..\')
        error('Richiesta fallita');
    end

    if response.State == "completed"
        downloadedFilePaths = response.OutputArguments{1};
        %citation = response.OutputArguments{2};
    end

    dataFine = datetime(response.FinishDateTime,'Format','yyyy-MM-dd hh:mm:ss');
    fprintf('Data e ora di fine: %s\n', dataFine);
    fprintf('Tempo di esecuzione : %s\n',  dataFine - dataCreazione);

    cd('..\')

    disp(downloadedFilePaths)
    pathDataset = strcat('dataset/',downloadedFilePaths(1));
    %pathJson = strcat('dataset/',downloadedFilePaths(2));
    %pathPNG = strcat('dataset/',downloadedFilePaths(3));
else
    pathDataset=[];
end

end
