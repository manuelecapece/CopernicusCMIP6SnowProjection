function plotDati(snow,variable,T,time,year_string)
%Plotta il grafico della variabile selezionata

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

snow_mean = mean(snow,1);
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

figure();

%Area plot media annua scala logaritmica interpolato
mediaAnnua = mean(snow_mean_reshaped,2);
uniqueYears = unique(year(T));
years_date = datetime(uniqueYears, 1, 1);
T_interpolato = linspace(min(years_date), max(years_date), size(years_date,1)*8);
snow_interp_T = interp1(years_date', mediaAnnua, T_interpolato, 'pchip');

a = area(T_interpolato,snow_interp_T,'FaceAlpha', 0.2);
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
bh(1).FaceColor = rgb('CadetBlue');  
bh(2).FaceColor = rgb('RoyalBlue');
bh(3).FaceColor = rgb('SkyBlue');
bh(4).FaceColor = rgb('LightBlue');
bh(5).FaceColor = rgb('LightSteelBlue');
legend('Media annua','Gennaio', 'Febbraio','Marzo','Aprile','Dicembre','FontSize', 13);
ax = gca;
ax.XTick = years_date;
ax.XTickLabel = datestr(years_date, 'yyyy');

hold off

end

