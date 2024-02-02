function plotSurfaceSnowAmount(snw,T)
% Crea grafico della Surface snow amount [kg m^-2] media in Basilicata per mese.
% Quantità di neve al suolo, esclusa quella sulla chioma delle piante 
% o della vegetazione, per unità di superficie.

%Media neve basilicata
snw_mean = mean(snw,1);
snw_mean = mean(snw_mean,2);
snw_mean = reshape(snw_mean,[size(snw_mean,3),1]);

% Grafico a barre della quantita di neve in funzione del tempo
figure();
bar(T,snw_mean);
xlabel('Time [month]');
ylabel('Surface snow amount [kg m^{-2}]');
title('Media annua della quantita di neve per superficie');

end

