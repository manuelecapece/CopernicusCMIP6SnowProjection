function plotSnowfallFlux(snw,T)
% Crea grafico dello Snowfall flux [kg m^-2 s^-1] media in Basilicata per mese.
% Indica la massa di acqua sotto forma di neve che precipita per unità di superficie.

%Media neve basilicata
snw_mean = mean(snw,1);
snw_mean = mean(snw_mean,2);
snw_mean = reshape(snw_mean,[size(snw_mean,3),1]);

% Grafico a barre della quantita di neve in funzione del tempo
figure();
bar(T,snw_mean);
xlabel('Time [month]');
ylabel('Snowfall flux [kg m^-2 s^-1]');
title('Media annua delle precipitazioni nevose');
end

