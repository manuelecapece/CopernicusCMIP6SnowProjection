function [pathDataset] = makeRequest(experiment,variable,model,year)
%Effettua la richiesta API, restituisce la struttura contentente le opzioni 
%della richiesta API e il nome del dataset

cd('dataset\')

datasetName = "projections-cmip6";
datasetOptions.temporal_resolution = "monthly";
datasetOptions.month  = ["01", "02", "03","04","12"]; %Da Dicembre a Aprile

datasetOptions.experiment  = experiment;
datasetOptions.variable  = variable;
datasetOptions.model  = model;
datasetOptions.year = year; 

downloadedFilePaths = climateDataStoreDownload(datasetName,datasetOptions);

cd('..\')


pathDataset = strcat('Dataset/',downloadedFilePaths(1));
pathJson = strcat('Dataset/',downloadedFilePaths(2));
pathPNG = strcat('Dataset/',downloadedFilePaths(3));

end
