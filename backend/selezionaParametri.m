function [experiment,year] = selezionaParametri(sceltaEsperimento,startYear,endYear)
%Restituisce l'esperimento e l'asse dei tempi selezionati dall'utente 

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


% m = Modelli;
% %SSP1
% dizionarioModelli.ssp1_1_9   = [m.europa2, m.europa3, m.europa5, m.francia2, m.francia4];
% dizionarioModelli.ssp1_2_6   = [m.europa5, m.francia1, m.francia2, m.francia3, m.francia4, m.francia5, m.italia1 ,m.italia2, m.germania1, m.germania2, m.norvegia1, m.norvegia2, m.inghilterra1, m.inghilterra2];
% %SSP2
% dizionarioModelli.ssp2_4_5   = [m.europa4, m.europa5, m.francia1, m.francia2, m.francia3, m.francia4, m.italia1, m.italia2, m.germania1, m.germania2, m.norvegia1, m.norvegia2, m.inghilterra1];
% %SSP3
% dizionarioModelli.ssp3_7_0   = [m.europa1, m.europa5, m.francia1, m.francia2, m.francia3, m.francia4, m.francia5, m.italia2, m.germania1, m.germania2, m.norvegia1, m.norvegia2, m.svizzera1];
% %SSP4
% dizionarioModelli.ssp4_3_4   = [m.europa3, m.francia2, m.francia4];
% dizionarioModelli.ssp4_6_0   = [m.francia2, m.francia4];
% %SSP5
% dizionarioModelli.ssp5_3_4os = [m.europa3, m.francia2, m.francia4];
% dizionarioModelli.ssp5_8_5   = [m.europa4, m.europa5, m.francia1, m.francia2, m.francia3, m.francia4, m.italia1, m.italia2, m.germania1, m.germania2, m.norvegia1, m.norvegia2, m.inghilterra1, m.inghilterra2];

% switch experiment
%     case "ssp1_1_9"
%         modelsAvaible = dizionarioModelli.ssp1_1_9;
%     case "ssp1_2_6"
%         modelsAvaible = dizionarioModelli.ssp1_2_6;
%     case "ssp4_3_4"
%         modelsAvaible = dizionarioModelli.ssp4_3_4;
%     case "ssp5_3_4os"
%         modelsAvaible = dizionarioModelli.ssp5_3_4os;
%     case "ssp2_4_5"
%         modelsAvaible = dizionarioModelli.ssp2_4_5;
%     case "ssp4_6_0"
%         modelsAvaible = dizionarioModelli.ssp4_6_0;
%     case "ssp3_7_0"
%         modelsAvaible = dizionarioModelli.ssp3_7_0;
%     case "ssp5_8_5"
%         modelsAvaible = dizionarioModelli.ssp5_8_5;
% end

end

