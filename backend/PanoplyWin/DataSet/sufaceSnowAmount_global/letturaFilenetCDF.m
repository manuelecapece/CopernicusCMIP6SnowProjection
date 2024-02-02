ncid = netcdf.open('snow.nc')
ncdisp('snow.nc')

time = netcdf.getVar(ncid,0);%time
time_bnds = netcdf.getVar(ncid,1);%time_bnds
lat = netcdf.getVar(ncid,2);%Latitude
lat_bnds = netcdf.getVar(ncid,3);%lat_bnds
lon = netcdf.getVar(ncid,4);%Longitude
lon_bnds = netcdf.getVar(ncid,5);%lon_bnds
snw = netcdf.getVar(ncid,6);%Surface Snow Amount

netcdf.close(ncid)

%Conversione di esempio non corretta
T = datetime( time,'convertfrom','modifiedjuliandate','Format','dd-MMM-yyyy G HH:mm:ss');

%Filtro su latitudini da 37.5672886 a 41.0467407
%Filtro su longitudini da 15.5150000 a 16.1436965

maschera_lat_bas = (lat > 37.5672886) & (lat < 41.0467407);
lat_basilicata = lat(maschera_lat_bas);

maschera_lon_bas = (lon > 15.4296582) & (lon < 16.3306481);
lon_basilicata = lon(maschera_lon_bas);

%Filtro LON

sn = snw .* maschera_lon_bas;

zeroRows = all(sn(:,:,1) == 0, 2);

sn(zeroRows, :,:) = [];

zeroColumns = all(sn(:,:,1) == 0, 1);

sn(:, zeroColumns,:) = [];

%Filtro LAT
lat = sn(1,:,1);

maschera_lat_bas = (lat > 37.5672886) & (lat < 41.0467407);

sn = sn .* maschera_lat_bas;

zeroRows = all(sn(:,:,1) == 0, 2);

sn(zeroRows, :,:) = [];

zeroColumns = all(sn(:,:,1) == 0, 1);

sn(:, zeroColumns,:) = [];

localita1 = sn(1,:,:);
localita1 = localita1(:);

localita2 = sn(2,:,:);
localita2 = localita2(:);

figure();
plot(T, localita1 ,'o','LineWidth', 1.5)
xlabel('time');
ylabel('snow kg m-2')
text = ['Regressione localita 1 '];
title(text);

figure();
plot(T, localita2 ,'o','LineWidth', 1.5)
xlabel('time');
ylabel('snow kg m-2')
text = ['Regressione localita 2 '];
title(text);

%Media annua
j=1;
for i = 1 : 12 : 84
    i
    delta = 11;
    k = i + delta
    tot = sum(localita1(i : k));
    mean = tot/12;
    mediaAnnua(j) = mean;
    j=j+1;
end

mean1 = sum(localita1(1:12))
mean = tot/12;

figure();
plot(mediaAnnua ,'x','LineWidth', 1.5)
xlabel('time');
ylabel('snow kg m-2')
text = ['Media annua localita 1'];
title(text);


