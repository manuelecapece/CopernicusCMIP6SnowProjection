function [snw_bas] = filtraDati(lat,lon,snw)
%Effettua il filtraggio dei dati sulle coordinate della basilicata

%Limiti coordinate Basilicata in decimi
lat_limNord = 41.14259185419015; 
lat_limSud = 39.89887436892153; 
log_limOvest = 15.335165465511388;
log_limEst = 16.867273609566762;

maschera_lat_bas = (lat > lat_limSud) & (lat < lat_limNord);
lat_basilicata = lat(maschera_lat_bas);
fprintf('Latitudini basilicata: %s\n', mat2str(lat_basilicata));

maschera_lon_bas = (lon > log_limOvest) & (lon < log_limEst);
lon_basilicata = lon(maschera_lon_bas);
fprintf('Longitudini basilicata: %s\n', mat2str(lon_basilicata));

%Filtraggio su latitudini e longitudini

snw_bas = snw .* maschera_lon_bas;
snw_bas = snw_bas .* maschera_lat_bas';

zeroRows = all(snw_bas(:,:,1) == 0, 2);
snw_bas(zeroRows, :,:) = [];
zeroColumns = all(snw_bas(:,:,1) == 0, 1);
snw_bas(:, zeroColumns,:) = [];

disp(newline)
disp(['Dimensioni matrice filtrata sn_bas : ' num2str(size(snw_bas))]);

end

