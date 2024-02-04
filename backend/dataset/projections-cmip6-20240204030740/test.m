clc;
clear all;

pathDataset = 'prsn_Amon_EC-Earth3-CC_ssp245_r1i1p1f1_gr_20150116-20221216_v20210113.nc'

ncid = netcdf.open(pathDataset);

disp(newline)
ncdisp(pathDataset)

var = ncread(pathDataset,'lat');

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
        disp(varName)
        snwId = netcdf.inqVarID(ncid,varName);
    end
end


snw = netcdf.getVar(ncid,snwId);


% timeId = netcdf.inqVarID(ncid,'time');
% latId = netcdf.inqVarID(ncid,'lat');
% lonId = netcdf.inqVarID(ncid,'lon');
% snwId = 0;
% 
% try
%     snwId = netcdf.inqVarID(ncid,'snw');
% catch
%     snwId = netcdf.inqVarID(ncid,'snd');
% end
% 
% time = netcdf.getVar(ncid,timeId);
% lat = netcdf.getVar(ncid,latId);
% lon = netcdf.getVar(ncid,lonId);
% snw = netcdf.getVar(ncid,snwId);



netcdf.close(ncid);