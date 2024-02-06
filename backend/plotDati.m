function plotDati(snow_basilicata,variable,time,years_string)
%Plotta il grafico della variabile selezionata

%% Operazioni preliminari

startYear = str2num(years_string(1));

%Conversione delle date
T = convertiDate(time,startYear);

switch variable
    case "snow_depth"
        % Imposto etichette grafico Snow depth
        testoXlabel = 'Time [year]';
        testoYlabel = 'Snow depth [m] - Log scale';
        testoTitolo = 'Spessore della neve medio tra le coordinate della Basilicata';
    case "snowfall_flux"
        % Imposto etichette grafico Snowfall flux
        testoXlabel = 'Time [year]';
        testoYlabel = 'Snowfall flux [kg m^{-2} s^{-1}] - Log scale';
        testoTitolo = 'Flusso di precipitazioni nevose medio tra le coordinate della Basilicata';
    case "surface_snow_amount"
        % Imposto etichette grafico Surface snow amount
        testoXlabel = 'Time [year]';
        testoYlabel = 'Surface snow amount [kg m^{-2}] - Log scale';
        testoTitolo = 'Quantita di neve per superficie media tra le coordinate della Basilicata';
end

snow_mean = mean(snow_basilicata,1);
snow_mean = mean(snow_mean,2);

%Reshape della matrice snow_mean per fare plot a barre per mese
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

%% Grafico 1

figure();

%Area plot media annua scala logaritmica interpolato

mediaAnnua = mean(snow_mean_reshaped,2);
uniqueYears = unique(year(T));
years_date = datetime(uniqueYears, 1, 1);
T_interpolato = linspace(min(years_date), max(years_date), size(years_date,1)*8);
years_date = years_date';

fprintf('T_interpolato  : %d x %d\n', size(T_interpolato));
fprintf('years_date     : %d x %d\n', size(years_date));
fprintf('mediaAnnua     : %d x %d\n', size(mediaAnnua));

snow_interp_T = interp1(years_date, mediaAnnua, T_interpolato, 'pchip');

a = area(T_interpolato,snow_interp_T,'FaceAlpha', 0.3);
a.FaceColor = rgb('SkyBlue');
a.EdgeColor =  rgb('LightSteelBlue');
a.LineWidth = 0.5;
set (gca, 'Yscale', 'log')
xlabel(testoXlabel, 'FontSize', 13);
ylabel(testoYlabel,'FontSize', 13);
title(testoTitolo,'FontSize', 16);

hold on;

%Grafico a barre della quantita di neve in funzione degli anni
bh = bar(years_date,snow_mean_reshaped,'BarWidth', 1,'LineWidth',1);
bh(1).FaceColor = rgb('CadetBlue');%CadetBlue
bh(2).FaceColor = rgb('DodgerBlue');%RoyalBlue
bh(3).FaceColor = rgb('RoyalBlue');%SkyBlue
bh(4).FaceColor = rgb('SkyBlue');%LightBlue
bh(5).FaceColor = rgb('SlateGray');%LightSteelBlue
legend('Media annua','Gennaio', 'Febbraio','Marzo','Aprile','Dicembre','FontSize', 13);
ax = gca;
ax.XTick = years_date;
ax.XTickLabel = datestr(years_date, 'yyyy');
disableDefaultInteractivity(gca)

hold off

% %% Grafico 2
% 
% figure();
% 
% %Area plot media annua scala logaritmica interpolato
% 
% mediaAnnua = mean(snow_mean_reshaped,2);
% uniqueYears = unique(year(T));
% years_date = datetime(uniqueYears, 1, 1);
% T_interpolato = linspace(min(years_date), max(years_date), size(years_date,1)*8);
% years_date = years_date';
% 
% fprintf('T_interpolato  : %d x %d\n', size(T_interpolato));
% fprintf('years_date     : %d x %d\n', size(years_date));
% fprintf('mediaAnnua     : %d x %d\n', size(mediaAnnua));
% 
% snow_interp_T = interp1(years_date, mediaAnnua, T_interpolato, 'pchip');
% 
% a = area(T_interpolato,snow_interp_T,'FaceAlpha', 1);
% a.FaceColor = rgb('LightPink');
% a.EdgeColor =  rgb('LightSteelBlue');
% a.LineWidth = 0.5;
% set (gca, 'Yscale', 'log')
% xlabel(testoXlabel, 'FontSize', 13);
% ylabel(testoYlabel,'FontSize', 13);
% title(testoTitolo,'FontSize', 16);
% 
% hold on;
% 
% %Area plot medio del mese di Gennaio scala logaritmica interpolato
% mediaGennaio = snow_mean_reshaped(:,1);
% dateGennaio = T(month(T) == 1);
% dateGennaio_interpolato = linspace(min(dateGennaio), max(dateGennaio), size(dateGennaio,1)*8);
% dateGennaio = dateGennaio';
% 
% fprintf('dateGennaio_interpolato : %d x %d\n', size(dateGennaio_interpolato));
% fprintf('dateGennaio             : %d x %d\n', size(dateGennaio));
% fprintf('mediaGennaio            : %d x %d\n', size(mediaGennaio));
% 
% snow_interp_gennaio = interp1(dateGennaio, mediaGennaio, dateGennaio_interpolato, 'pchip');
% 
% ag = area(dateGennaio_interpolato,snow_interp_gennaio,'FaceAlpha', 0.5);
% ag.FaceColor = rgb('Blue');
% ag.EdgeColor =  rgb('DarkGrey');
% ag.LineWidth = 0.5;
% 
% %Area plot medio del mese di Febbraio scala logaritmica interpolato
% mediaFebbraio = snow_mean_reshaped(:,1);
% dateFebbraio = T(month(T) == 2);
% dateFebbraio_interpolato = linspace(min(dateFebbraio), max(dateFebbraio), size(dateFebbraio,1)*8);
% dateFebbraio = dateFebbraio';
% snow_interp_febbraio = interp1(dateFebbraio, mediaFebbraio, dateFebbraio_interpolato, 'pchip');
% af = area(dateFebbraio_interpolato,snow_interp_febbraio,'FaceAlpha', 0.5);
% af.FaceColor = rgb('Chocolate');
% af.EdgeColor =  rgb('DarkGrey');
% af.LineWidth = 0.5;
% 
% %Area plot medio del mese di Marzo scala logaritmica interpolato
% mediaMarzo = snow_mean_reshaped(:,1);
% dateMarzo = T(month(T) == 3);
% dateMarzo_interpolato = linspace(min(dateMarzo), max(dateMarzo), size(dateMarzo,1)*8);
% dateMarzo = dateMarzo';
% snow_interp_marzo = interp1(dateMarzo, mediaMarzo, dateMarzo_interpolato, 'pchip');
% am = area(dateMarzo_interpolato,snow_interp_marzo,'FaceAlpha', 0.5);
% am.FaceColor = rgb('SeaGreen');
% am.EdgeColor =  rgb('DarkGrey');
% am.LineWidth = 0.5;
% 
% %Area plot medio del mese di Aprile scala logaritmica interpolato
% mediaAprile = snow_mean_reshaped(:,1);
% dateAprile = T(month(T) == 4);
% dateAprile_interpolato = linspace(min(dateAprile), max(dateAprile), size(dateAprile,1)*8);
% dateAprile = dateAprile';
% snow_interp_aprile = interp1(dateAprile, mediaAprile, dateAprile_interpolato, 'pchip');
% aa = area(dateAprile_interpolato,snow_interp_aprile,'FaceAlpha', 0.5);
% aa.FaceColor = rgb('Cyan');
% aa.EdgeColor =  rgb('DarkGrey');
% aa.LineWidth = 0.5;
% 
% 
% %Area plot medio del mese di Dicembre scala logaritmica interpolato
% mediaDicembre = snow_mean_reshaped(:,1);
% dateDicembre = T(month(T) == 12);
% dateDicembre_interpolato = linspace(min(dateDicembre), max(dateDicembre), size(dateDicembre,1)*8);
% dateDicembre = dateDicembre';
% snow_interp_dicembre = interp1(dateDicembre, mediaDicembre, dateDicembre_interpolato, 'pchip');
% ad = area(dateDicembre_interpolato,snow_interp_dicembre,'FaceAlpha', 0.5);
% ad.FaceColor = rgb('RoyalBlue');
% ad.EdgeColor =  rgb('DarkGrey');
% ad.LineWidth = 0.5;
% 
% legend('Media annua','Gennaio','Febbraio', 'Marzo', 'Aprile', 'Dicembre','FontSize', 13);
% 
% %% Grafico 3
% 
% figure();
% 
% %Area plot media annua scala logaritmica interpolato
% 
% mediaAnnua = mean(snow_mean_reshaped,2);
% uniqueYears = unique(year(T));
% years_date = datetime(uniqueYears, 1, 1);
% T_interpolato = linspace(min(years_date), max(years_date), size(years_date,1)*8);
% years_date = years_date';
% 
% snow_interp_T = interp1(years_date, mediaAnnua, T_interpolato, 'pchip');
% 
% a2 = area(T_interpolato,snow_interp_T,'FaceAlpha', 0.7);
% a2.FaceColor = rgb('SkyBlue');
% a2.EdgeColor =  rgb('LightSteelBlue');
% a2.LineWidth = 0.5;
% set (gca, 'Yscale', 'log')
% xlabel(testoXlabel, 'FontSize', 13);
% ylabel(testoYlabel,'FontSize', 13);
% title(testoTitolo,'FontSize', 16);
% 
% hold on;
% 
% %Grafico a barre della quantita di neve in funzione degli anni
% bh = bar(years_date,snow_mean_reshaped,'BarWidth', 1,'LineWidth',1,'FaceAlpha', 0.5);
% bh(1).FaceColor = rgb('Green');%CadetBlue
% bh(2).FaceColor = rgb('Blue');
% bh(3).FaceColor = rgb('Cyan');
% bh(4).FaceColor = rgb('SkyBlue');
% bh(5).FaceColor = rgb('DarkGray');
% legend('Media annua','Gennaio', 'Febbraio','Marzo','Aprile','Dicembre','FontSize', 13);
% a2x = gca;
% a2x.XTick = years_date;
% a2x.XTickLabel = datestr(years_date, 'yyyy');
% disableDefaultInteractivity(gca)
% 
% hold off
% 
% %% Grafico 4
% 
% figure();
% 
% %Area plot media annua scala logaritmica interpolato
% subplot(2,1,1);
% mediaAnnua = mean(snow_mean_reshaped,2);
% uniqueYears = unique(year(T));
% years_date = datetime(uniqueYears, 1, 1);
% T_interpolato = linspace(min(years_date), max(years_date), size(years_date,1)*8);
% years_date = years_date';
% 
% snow_interp_T = interp1(years_date, mediaAnnua, T_interpolato, 'pchip');
% 
% a = area(T_interpolato,snow_interp_T,'FaceAlpha', 1);
% a.FaceColor = rgb('LightPink');
% a.EdgeColor =  rgb('LightSteelBlue');
% a.LineWidth = 0.5;
% set (gca, 'Yscale', 'log')
% xlabel(testoXlabel, 'FontSize', 13);
% ylabel(testoYlabel,'FontSize', 13);
% title(testoTitolo,'FontSize', 16);
% 
% subplot(2,1,2);
% %Area plot medio del mese di Gennaio scala logaritmica interpolato
% mediaGennaio = snow_mean_reshaped(:,1);
% dateGennaio = T(month(T) == 1);
% dateGennaio_interpolato = linspace(min(dateGennaio), max(dateGennaio), size(dateGennaio,1)*8);
% dateGennaio = dateGennaio';
% 
% snow_interp_gennaio = interp1(dateGennaio, mediaGennaio, dateGennaio_interpolato, 'pchip');
% 
% ag = area(dateGennaio_interpolato,snow_interp_gennaio,'FaceAlpha', 0.5);
% ag.FaceColor = rgb('Blue');
% ag.EdgeColor =  rgb('DarkGrey');
% ag.LineWidth = 0.5;
% 
% hold on;
% %Area plot medio del mese di Febbraio scala logaritmica interpolato
% mediaFebbraio = snow_mean_reshaped(:,1);
% dateFebbraio = T(month(T) == 2);
% dateFebbraio_interpolato = linspace(min(dateFebbraio), max(dateFebbraio), size(dateFebbraio,1)*8);
% dateFebbraio = dateFebbraio';
% snow_interp_febbraio = interp1(dateFebbraio, mediaFebbraio, dateFebbraio_interpolato, 'pchip');
% af = area(dateFebbraio_interpolato,snow_interp_febbraio,'FaceAlpha', 0.5);
% af.FaceColor = rgb('Chocolate');
% af.EdgeColor =  rgb('DarkGrey');
% af.LineWidth = 0.5;
% 
% %Area plot medio del mese di Marzo scala logaritmica interpolato
% mediaMarzo = snow_mean_reshaped(:,1);
% dateMarzo = T(month(T) == 3);
% dateMarzo_interpolato = linspace(min(dateMarzo), max(dateMarzo), size(dateMarzo,1)*8);
% dateMarzo = dateMarzo';
% snow_interp_marzo = interp1(dateMarzo, mediaMarzo, dateMarzo_interpolato, 'pchip');
% am = area(dateMarzo_interpolato,snow_interp_marzo,'FaceAlpha', 0.5);
% am.FaceColor = rgb('SeaGreen');
% am.EdgeColor =  rgb('DarkGrey');
% am.LineWidth = 0.5;
% 
% %Area plot medio del mese di Aprile scala logaritmica interpolato
% mediaAprile = snow_mean_reshaped(:,1);
% dateAprile = T(month(T) == 4);
% dateAprile_interpolato = linspace(min(dateAprile), max(dateAprile), size(dateAprile,1)*8);
% dateAprile = dateAprile';
% snow_interp_aprile = interp1(dateAprile, mediaAprile, dateAprile_interpolato, 'pchip');
% aa = area(dateAprile_interpolato,snow_interp_aprile,'FaceAlpha', 0.5);
% aa.FaceColor = rgb('Cyan');
% aa.EdgeColor =  rgb('DarkGrey');
% aa.LineWidth = 0.5;
% 
% 
% %Area plot medio del mese di Dicembre scala logaritmica interpolato
% mediaDicembre = snow_mean_reshaped(:,1);
% dateDicembre = T(month(T) == 12);
% dateDicembre_interpolato = linspace(min(dateDicembre), max(dateDicembre), size(dateDicembre,1)*8);
% dateDicembre = dateDicembre';
% snow_interp_dicembre = interp1(dateDicembre, mediaDicembre, dateDicembre_interpolato, 'pchip');
% ad = area(dateDicembre_interpolato,snow_interp_dicembre,'FaceAlpha', 0.5);
% ad.FaceColor = rgb('RoyalBlue');
% ad.EdgeColor =  rgb('DarkGrey');
% ad.LineWidth = 0.5;
% 
% legend('Gennaio','Febbraio', 'Marzo', 'Aprile', 'Dicembre','FontSize', 13);
% title([testoTitolo,' scala lineare'],'FontSize', 16);
% 
% hold off;
% 
% %% Grafico 5
% 
% figure();
% 
% %Area plot media annua scala logaritmica interpolato
% subplot(2,1,1);
% mediaAnnua = mean(snow_mean_reshaped,2);
% uniqueYears = unique(year(T));
% years_date = datetime(uniqueYears, 1, 1);
% T_interpolato = linspace(min(years_date), max(years_date), size(years_date,1)*8);
% years_date = years_date';
% 
% snow_interp_T = interp1(years_date, mediaAnnua, T_interpolato, 'pchip');
% 
% a = area(T_interpolato,snow_interp_T,'FaceAlpha', 1);
% a.FaceColor = rgb('LightPink');
% a.EdgeColor =  rgb('LightSteelBlue');
% a.LineWidth = 0.5;
% set (gca, 'Yscale', 'log')
% xlabel(testoXlabel, 'FontSize', 13);
% ylabel(testoYlabel,'FontSize', 13);
% title(testoTitolo,'FontSize', 16);
% 
% subplot(2,1,2);
% %Area plot medio del mese di Gennaio scala logaritmica interpolato
% mediaGennaio = snow_mean_reshaped(:,1);
% dateGennaio = T(month(T) == 1);
% dateGennaio_interpolato = linspace(min(dateGennaio), max(dateGennaio), size(dateGennaio,1)*8);
% dateGennaio = dateGennaio';
% 
% snow_interp_gennaio = interp1(dateGennaio, mediaGennaio, dateGennaio_interpolato, 'pchip');
% 
% ag = area(dateGennaio_interpolato,snow_interp_gennaio,'FaceAlpha', 0.5);
% ag.FaceColor = rgb('Blue');
% ag.EdgeColor =  rgb('DarkGrey');
% ag.LineWidth = 0.5;
% 
% hold on;
% %Area plot medio del mese di Febbraio scala logaritmica interpolato
% mediaFebbraio = snow_mean_reshaped(:,1);
% dateFebbraio = T(month(T) == 2);
% dateFebbraio_interpolato = linspace(min(dateFebbraio), max(dateFebbraio), size(dateFebbraio,1)*8);
% dateFebbraio = dateFebbraio';
% snow_interp_febbraio = interp1(dateFebbraio, mediaFebbraio, dateFebbraio_interpolato, 'pchip');
% af = area(dateFebbraio_interpolato,snow_interp_febbraio,'FaceAlpha', 0.5);
% af.FaceColor = rgb('Chocolate');
% af.EdgeColor =  rgb('DarkGrey');
% af.LineWidth = 0.5;
% 
% %Area plot medio del mese di Marzo scala logaritmica interpolato
% mediaMarzo = snow_mean_reshaped(:,1);
% dateMarzo = T(month(T) == 3);
% dateMarzo_interpolato = linspace(min(dateMarzo), max(dateMarzo), size(dateMarzo,1)*8);
% dateMarzo = dateMarzo';
% snow_interp_marzo = interp1(dateMarzo, mediaMarzo, dateMarzo_interpolato, 'pchip');
% am = area(dateMarzo_interpolato,snow_interp_marzo,'FaceAlpha', 0.5);
% am.FaceColor = rgb('SeaGreen');
% am.EdgeColor =  rgb('DarkGrey');
% am.LineWidth = 0.5;
% 
% %Area plot medio del mese di Aprile scala logaritmica interpolato
% mediaAprile = snow_mean_reshaped(:,1);
% dateAprile = T(month(T) == 4);
% dateAprile_interpolato = linspace(min(dateAprile), max(dateAprile), size(dateAprile,1)*8);
% dateAprile = dateAprile';
% snow_interp_aprile = interp1(dateAprile, mediaAprile, dateAprile_interpolato, 'pchip');
% aa = area(dateAprile_interpolato,snow_interp_aprile,'FaceAlpha', 0.5);
% aa.FaceColor = rgb('Cyan');
% aa.EdgeColor =  rgb('DarkGrey');
% aa.LineWidth = 0.5;
% 
% 
% %Area plot medio del mese di Dicembre scala logaritmica interpolato
% mediaDicembre = snow_mean_reshaped(:,1);
% dateDicembre = T(month(T) == 12);
% dateDicembre_interpolato = linspace(min(dateDicembre), max(dateDicembre), size(dateDicembre,1)*8);
% dateDicembre = dateDicembre';
% snow_interp_dicembre = interp1(dateDicembre, mediaDicembre, dateDicembre_interpolato, 'pchip');
% ad = area(dateDicembre_interpolato,snow_interp_dicembre,'FaceAlpha', 0.5);
% ad.FaceColor = rgb('RoyalBlue');
% ad.EdgeColor =  rgb('DarkGrey');
% ad.LineWidth = 0.5;
% 
% legend('Gennaio','Febbraio', 'Marzo', 'Aprile', 'Dicembre','FontSize', 13);
% 
% set (gca, 'Yscale', 'log')
% xlabel(testoXlabel, 'FontSize', 13);
% ylabel(testoYlabel,'FontSize', 13);
% title(testoTitolo,'FontSize', 16);
% 
% hold off;


end

