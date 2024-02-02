function plotSnowDepth(snw,T)
% Crea grafico della Snow depth [m] media in Basilicata per mese.
% Indica lo spessore della neve.

%Media neve basilicata
snw_mean = mean(snw,1);
snw_mean = mean(snw_mean,2);
snw_mean = reshape(snw_mean,[size(snw_mean,3),1]);

% Grafico a barre della quantita di neve in funzione del tempo
figure();
bar(T,snw_mean);
xlabel('Time [month]');
ylabel('Snow depth [m]');
title('Media annua dello spessore della neve');
end

