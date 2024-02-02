function plotDati(snw,variabile,T)
%Plotta il grafico della variabile selezionata

switch variabile
    case "snow_depth"
        % Creazione grafico Snow depth
        plotSnowDepth(snw,T)
    case "snowfall_flux"
        % Creazione grafico Snowfall flux
        plotSnowfallFlux(snw,T)
    case "surface_snow_amount"
        % Creazione grafico Surface snow amount
        plotSurfaceSnowAmount(snw,T)
end

end

