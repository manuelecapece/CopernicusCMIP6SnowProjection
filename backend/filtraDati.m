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

if(isempty(lat_basilicata) || isempty(lon_basilicata))
    error('Il modello selezionato non contiene dati relativi alle coordinate geografiche della Basilicata');
end

%Filtraggio su latitudini e longitudini

% snw_bas = snw .* maschera_lon_bas;
% snw_bas = snw_bas .* maschera_lat_bas';
% zeroRows = all(snw_bas(:,:,1) == 0, 2);
% snw_bas(zeroRows, :,:) = [];
% zeroColumns = all(snw_bas(:,:,1) == 0, 1);
% snw_bas(:, zeroColumns,:) = [];

% indici_lat_bas = find(lat == lat_basilicata);
% indici_lon_bas = find(lon == lon_basilicata);
% snw_bas = snw(indici_lon_bas,indici_lat_bas,:);

snw_bas = snw(maschera_lon_bas,maschera_lat_bas,:);

disp(['Dimensioni matrice filtrata sn_bas : ' num2str(size(snw_bas))]);

end

