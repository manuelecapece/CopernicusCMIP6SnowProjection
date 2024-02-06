function [experiment, variable, year, models] = selezionaParametri(sceltaEsperimento, sceltaVariabile, startYear, endYear)
%Restituisce l'esperimento, la variabile, l'asse dei tempi selezionati dall'utente 
% e la lista di modelli disponibili per la selezione

experiments = ["ssp1_1_9", "ssp1_2_6", "ssp2_4_5", "ssp3_7_0", "ssp4_3_4", "ssp4_6_0", "ssp5_3_4os", "ssp5_8_5"];

if(sceltaEsperimento < 1 || sceltaEsperimento > 8)
    error("Scelta esperimento non valida");
end
if(startYear < 2015 || startYear > 2099 )
    error("Anno di inizio non valido");
end
if(endYear < 2016 || endYear > 2100)
    error("Anno di fine non valido");
end
if(startYear == endYear)
    error("L'anno di inizio deve essere diverso dall'anno di fine");
end
if(startYear > endYear)
    error("L'anno di inizio deve essere minore dell'anno di fine");
end

experiment = experiments(sceltaEsperimento);

if(strcmp(experiment,'ssp5_3_4os') && startYear < 2040)
    startYear = 2040;
end

year = creaStringaAnni(startYear,endYear);

%Seleziona variabile
[variable, models] = selezionaVariabile(experiment, sceltaVariabile);

end

