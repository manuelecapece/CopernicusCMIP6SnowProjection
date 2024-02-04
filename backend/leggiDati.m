function [time,lat,lon,snw] = leggiDati(pathDataset)
%Restituisce i dati che servono contenuti nel dataSet netCDF

try 
    ncid = netcdf.open(pathDataset);
    % disp(newline)
    % ncdisp(pathDataset)
    timeId = netcdf.inqVarID(ncid,'time');
    latId = netcdf.inqVarID(ncid,'lat');
    lonId = netcdf.inqVarID(ncid,'lon');
    
    ncInfo = ncinfo(pathDataset);
    variableNames = {ncInfo.Variables.Name};
    n = size(variableNames,2);
    snwId = -1;
    for i = 1 : n
        varName = variableNames{i};
        if(~strcmp(varName , 'time') && ...
                ~strcmp(varName , 'time_bnds')  && ...
                ~strcmp(varName , 'lat')  && ...
                ~strcmp(varName , 'lat_bnds')  && ...
                ~strcmp(varName , 'lon')  && ...
                ~strcmp(varName,'lon_bnds'))
            fprintf('Nome variabile precipitazioni nevose: %s\n', varName);
            snwId = netcdf.inqVarID(ncid,varName);
        end
    end

    time = netcdf.getVar(ncid,timeId);
    lat = netcdf.getVar(ncid,latId);
    lon = netcdf.getVar(ncid,lonId);
    snw = netcdf.getVar(ncid,snwId);
    netcdf.close(ncid);
catch exception
    netcdf.close(ncid);
    error(exception.message, exception.identifier);
end

end

