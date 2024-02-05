pathDataset = 'snd_LImon_CMCC-CM2-SR5_ssp585_r1i1p1f1_gn_20150116-20221216_v20200622.nc'

ncid = netcdf.open(pathDataset);

disp(newline)
ncdisp(pathDataset)

timeId = netcdf.inqVarID(ncid,'time');
time = netcdf.getVar(ncid,timeId);

T = convertiDate(time)

netcdf.close(ncid);

