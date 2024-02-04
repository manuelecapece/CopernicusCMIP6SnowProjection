function [time,lat,lon,snw] = leggiDati(pathDataset)
%Restituisce i dati che servono contenuti nel dataSet netCDF

try 
    ncid = netcdf.open(pathDataset);
    % disp(newline)
    % ncdisp(pathDataset)
    timeId = netcdf.inqVarID(ncid,'time');
    latId = netcdf.inqVarID(ncid,'lat');
    lonId = netcdf.inqVarID(ncid,'lon');
    snwId = netcdf.inqVarID(ncid,'snw');
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

