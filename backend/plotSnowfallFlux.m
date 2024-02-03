function plotSnowfallFlux(snw,T,time,year)
% Crea grafico dello Snowfall flux [kg m^-2 s^-1] media in Basilicata per mese.
% Indica la massa di acqua sotto forma di neve che precipita per unità di superficie.

%Media neve basilicata
snw_mean = mean(snw,1);
snw_mean = mean(snw_mean,2);
snw_mean = reshape(snw_mean,[size(snw_mean,3),1])';

% Grafico a barre della quantita di neve in funzione del tempo
figure();
bar(T,snw_mean);
axis tight;
xlabel('Time [month]');
ylabel('Snowfall flux [kg m^{-2} s^{-1}]');
title('Media annua delle precipitazioni nevose');

%Grafico a barre 2
snw_mean2 = mean(snw,1);
snw_mean2 = mean(snw_mean2,2);
year_numeric = str2double(year);

%Reshape della matrice snw per fare print a barre per mese
k = 1;
for i = 1 : 5 :  size(snw_mean2,3)
    for j = 1 : 5
        snow_row(j) = snw_mean2(:,:,i+j-1);
    end
snowNuovo(k,:) = snow_row;
k=k+1;
end

figure();
bar(year_numeric,snowNuovo,'BarWidth', 1);
axis tight;
xlabel('Time [year]');
ylabel('Snowfall flux [kg m^{-2} s^{-1}]');
title('Media annua delle precipitazioni nevose');
legend('Gennaio', 'Febbraio','Marzo','Aprile','Dicembre');
end

