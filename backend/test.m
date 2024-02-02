% Query di esempio 1
experiment = "ssp1_1_9"; %=3
variable  = "surface_snow_amount"; %=2
model  = "ec_earth3_veg_lr"; %=1
yearStart = 2015;
yearEnd = 2100;
year = creaStringaAnni(yearStart,yearEnd)

datasetName = "projections-cmip6";
datasetOptions.temporal_resolution = "monthly";
datasetOptions.month  = ["01", "02", "03","04","12"]; %Da Dicembre a Aprile

datasetOptions.experiment  = experiment;
datasetOptions.variable  = variable;
datasetOptions.model  = model;
datasetOptions.year = year; 

F = climateDataStoreDownloadAsync(datasetName,datasetOptions);

fprintf('Data e ora di creazione: %s\n', datestr(F.CreateDateTime, 'yyyy-MM-dd hh:mm:ss'));
stato = '';
while (F.State ~= 'completed')
    if(stato ~= F.State)
        disp(['Stato richiesta: ', num2str(F.State)]);
        stato = F.State;
    end
end

F.wait();

if F.State == "completed"
    downloadedFilePaths = F.OutputArguments{1};
    citation = F.OutputArguments{2};
end

fprintf('Data e ora di fine: %s\n', datetime(F.FinishDateTime,'Format','yyyy-MM-dd hh:mm:ss'));
fprintf('Tempo di esecuzione : %s\n', F.RunningDuration);


