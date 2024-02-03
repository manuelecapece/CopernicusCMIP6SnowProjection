function [experiment, variable, year, models] = selezionaParametri(sceltaEsperimento, sceltaVariabile, startYear, endYear)
%Restituisce l'esperimento, la variabile, l'asse dei tempi selezionati dall'utente 
% e la lista di modelli disponibili per la selezione

experiments = ["ssp1_1_9", "ssp1_2_6", "ssp2_4_5", "ssp3_7_0", "ssp4_3_4", "ssp4_6_0", "ssp5_3_4os", "ssp5_8_5"];

if(sceltaEsperimento < 1 || sceltaEsperimento > 8)
    error("Scelta esperimento non valida");
end
if(startYear < 2015 || startYear > 20100)
    error("Anno di inizio non valido");
end
if(endYear < 2015 || endYear > 2100)
    error("Anno di fine non valido");
end

experiment = experiments(sceltaEsperimento);
year = creaStringaAnni(startYear,endYear);

%Seleziona variabile
[variable, models] = selezionaVariabile(experiment, sceltaVariabile);

end

