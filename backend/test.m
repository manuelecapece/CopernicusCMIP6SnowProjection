
pathDatasetBE = 'C:\Git\CopernicusCMIP6SnowProjection\backend\dataset\projections-cmip6-20240212043320\snw_LImon_EC-Earth3-Veg-LR_ssp370_r1i1p1f1_gr_20150116-21001216_v20201123.nc'
pathDatasetFE = '\\?\C:\Git\CopernicusCMIP6SnowProjection\frontend\..\backend\dataset\projections-cmip6-20240212051559\snd_LImon_EC-Earth3-Veg_ssp119_r1i1p1f1_gr_20150116-20241216_v20200226.nc'

ncid = netcdf.open(pathDatasetFE);
disp(newline)
ncdisp(pathDatasetFE)
timeId = netcdf.inqVarID(ncid,'time');
latId = netcdf.inqVarID(ncid,'lat');
lonId = netcdf.inqVarID(ncid,'lon');

ncInfo = ncinfo(pathDatasetFE);
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