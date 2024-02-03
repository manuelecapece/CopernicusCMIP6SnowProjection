function plotSurfaceSnowAmount(snow_basilicata,T,time,year)
% Crea grafico della Surface snow amount [kg m^-2] media in Basilicata per mese.
% Quantità di neve al suolo, esclusa quella sulla chioma delle piante 
% o della vegetazione, per unità di superficie.

% %Media neve basilicata
% snw_mean = mean(snw,1);
% snw_mean = mean(snw_mean,2);
% snw_mean = reshape(snw_mean,[size(snw_mean,3),1]);
% 
% % Grafico a barre della quantita di neve in funzione del tempo
% figure();
% bar(T,snw_mean,'barwidth', 1);
% xlabel('Time [month]');
% ylabel('Surface snow amount [kg m^{-2}]');
% title('Media annua della quantita di neve per superficie');
% ax = gca; % current axes
% ax.XTick = T;
% xtickformat('MMM-yyyy')
% 
% % Grafico a linea della quantita di neve in funzione del tempo
% figure();
% plot(T,snw_mean);
% xlabel('Time [month]');
% ylabel('Surface snow amount [kg m^{-2}]');
% title('Media annua della quantita di neve per superficie');

%Grafico a barre della quantita di neve in funzione del tempo - versione numerica
snow_mean = mean(snow_basilicata,1);
snow_mean = mean(snow_mean,2);
year_numeric = str2double(year);

%Reshape della matrice snw per fare print a barre per mese
k = 1;
snow_row = zeros(5,1);
snow_mean_reshaped = zeros(size(snow_mean,3)/5,5);
for i = 1 : 5 :  size(snow_mean,3)
    for j = 1 : 5
        snow_row(j) = snow_mean(:,:,i+j-1);
    end
snow_mean_reshaped(k,:) = snow_row;
k=k+1;
end

figure();
bh = bar(year_numeric,snow_mean_reshaped,'BarWidth', 1,'LineWidth',1.5);
bh(1).FaceColor = rgb('CadetBlue');  
bh(2).FaceColor = rgb('RoyalBlue');
bh(3).FaceColor = rgb('SkyBlue');
bh(4).FaceColor = rgb('LightBlue');
bh(5).FaceColor = rgb('LightSteelBlue');
legenda = legend('Gennaio', 'Febbraio','Marzo','Aprile','Dicembre');
set(legenda, 'AutoUpdate', 'off')

%Area plot media annua scala logaritmica interpolato
mediaAnnua = mean(snow_mean_reshaped,2);
year_interpolato = linspace(min(year_numeric), max(year_numeric), size(year_numeric,2)*8);
snow_interp = interp1(year_numeric, mediaAnnua, year_interpolato, 'pchip');

hold on;
a = area(year_interpolato,snow_interp,'FaceAlpha', 0.1);
a.FaceColor = rgb('SkyBlue');
a.EdgeColor =  rgb('LightSteelBlue');
a.LineWidth = 0.5;
xlabel('Time [year]');
ylabel('Surface snow amount [kg m^{-2}]');
set (gca, 'Yscale', 'log')
title('Media mensile della quantita di neve per superficie in basilicata');
hold off;


end

