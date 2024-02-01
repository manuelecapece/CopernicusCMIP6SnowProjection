function [datasetName, datasetOptions] = makeRequest(temporal_resolution,experiment,variable,model,year,month)
%Effettua la richiesta API, restituisce la struttura contentente le opzioni 
%della richiesta API e il nome del dataset

cd('Dataset\')

datasetName = "projections-cmip6";

datasetOptions.temporal_resolution = "monthly";
datasetOptions.experiment  = "ssp2_4_5";
datasetOptions.variable  = "snowfall_flux";
datasetOptions.model  = "ec_earth3_cc";
datasetOptions.year = ["2015", "2016", "2017","2018", "2019", "2020","2021", "2022"];
datasetOptions.month  = ["01", "02", "03","04", "05", "06","07", "08", "09","10", "11", "12"];

downloadedFilePaths = climateDataStoreDownload(datasetName,datasetOptions);

end
