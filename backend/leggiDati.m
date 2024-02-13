function [time,lat,lon,snw] = leggiDati(pathToDatasetFolder, datasetName, pathToBackend)
%Restituisce i dati che servono contenuti nel dataSet netCDF

fprintf('pathToDatasetFolder: \n\t%s\n', pathToDatasetFolder);
fprintf('datasetName: \n\t%s\n', datasetName);
fprintf('pathToBackend: \n\t%s\n', pathToBackend);

try 
    cd(pathToDatasetFolder);
    copyfile(pathToDatasetFolder, fullfile(pathToDatasetFolder, '..'));
    cd("..");
    ncid = netcdf.open(datasetName);
    % disp(newline)
    % ncdisp(pathToDataset)
    timeId = netcdf.inqVarID(ncid,'time');
    latId = netcdf.inqVarID(ncid,'lat');
    lonId = netcdf.inqVarID(ncid,'lon');
    
    ncInfo = ncinfo(datasetName);
    variableNames = {ncInfo.Variables.Name};
    n = size(variableNames,2);
    snwId = -1;

    disp(newline);
    for i = 1 : n
        varName = variableNames{i};
        if(strcmp(varName , 'snw') || strcmp(varName , 'snd')  || strcmp(varName , 'prsn'))
            fprintf('Nome variabile precipitazioni nevose: %s\n', varName);
            snwId = netcdf.inqVarID(ncid,varName);
        end
    end

    time = netcdf.getVar(ncid,timeId);
    lat = netcdf.getVar(ncid,latId);
    lon = netcdf.getVar(ncid,lonId);
    snw = netcdf.getVar(ncid,snwId);
    netcdf.close(ncid);
    cd(pathToBackend);
catch exception
    error(exception.message, exception.identifier);
    netcdf.close(ncid);
    cd(pathToBackend);
end

end

