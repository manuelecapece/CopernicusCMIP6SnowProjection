function [time,lat,lon,snw] = leggiDati(pathToDatasetFolder, datasetName, pathToBackend)
%Restituisce i dati che servono contenuti nel dataSet netCDF

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

    % for i = 1 : n
    %     varName = variableNames{i};
    %     if(~strcmp(varName , 'time') && ...
    %             ~strcmp(varName , 'time_bnds')  && ...
    %             ~strcmp(varName , 'lat')  && ...
    %             ~strcmp(varName , 'lat_bnds')  && ...
    %             ~strcmp(varName , 'lon')  && ...
    %             ~strcmp(varName,'lon_bnds'))
    %         fprintf('Nome variabile precipitazioni nevose: %s\n', varName);
    %         snwId = netcdf.inqVarID(ncid,varName);
    %     end
    % end

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

