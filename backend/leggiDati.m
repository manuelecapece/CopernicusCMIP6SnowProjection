function [time,lat,lon,snw] = leggiDati(pathDataset)
%Restituisce i dati che servono contenuti nel dataSet netCDF

try 
    ncid = netcdf.open(pathDataset);
    % disp(newline)
    % ncdisp(pathDataset)
    time = netcdf.getVar(ncid,0);%time
    time_bnds = netcdf.getVar(ncid,1);%time_bnds
    lat = netcdf.getVar(ncid,2);%Latitude
    lat_bnds = netcdf.getVar(ncid,3);%lat_bnds
    lon = netcdf.getVar(ncid,4);%Longitude
    lon_bnds = netcdf.getVar(ncid,5);%lon_bnds
    snw = netcdf.getVar(ncid,6);%Surface Snow Amount
    netcdf.close(ncid);
catch exception
    netcdf.close(ncid);
    error(exception.message, exception.identifier);
end

end

