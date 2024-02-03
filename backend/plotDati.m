function plotDati(snw,variabile,T,time,year)
%Plotta il grafico della variabile selezionata

switch variabile
    case "snow_depth"
        % Creazione grafico Snow depth
        plotSnowDepth(snw,T,time,year)
    case "snowfall_flux"
        % Creazione grafico Snowfall flux
        plotSnowfallFlux(snw,T,time,year)
    case "surface_snow_amount"
        % Creazione grafico Surface snow amount
        plotSurfaceSnowAmount(snw,T,time,year)
end

end

