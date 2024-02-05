function [model_nameQuery] = selezionaModello(modelsAvaible,sceltaModello)
%Restituisce il nome del modello selezionato tra quelli disponibili

if(sceltaModello < 1 || sceltaModello > size(modelsAvaible,2))
    error('Scelta del modello non valida');
end

model = modelsAvaible(sceltaModello);
if(isempty(model))
    error('Non ci sono modelli disponibili per la selezione effettuata')
end

m = Modelli;

switch model
    %Modelli europei
    case m.europa1
        model_nameQuery = 'ec_earth3_aerchem';
    case m.europa2
        model_nameQuery ='ec_earth3_veg' ;        
    case m.europa3
        model_nameQuery = 'ec_earth3';
    case m.europa4
        model_nameQuery = 'ec_earth3_cc';
    case m.europa5
        model_nameQuery = 'ec_earth3_veg_lr';

    %Modelli Francesi
    case m.francia1
        model_nameQuery = 'cnrm_cm6_1_hr';
    case m.francia2
        model_nameQuery = 'ipsl_cm6a_lr';
    case m.francia3
        model_nameQuery = 'cnrm_cm6_1';
    case m.francia4
        model_nameQuery = 'cnrm_esm2_1';
    case m.francia5
        model_nameQuery = 'ipsl_cm5a2_inca'; 

    %Modelli Italiani
    case m.italia1
        model_nameQuery = 'cmcc_esm2';  
    case m.italia2
        model_nameQuery = 'cmcc_cm2_sr5';
    %Modelli Tedeschi
    case m.germania1
        model_nameQuery = 'awi_cm_1_1_mr';  
    case m.germania2
        model_nameQuery = 'mpi_esm1_2_lr';  

    %Modelli Norvegesi
    case m.norvegia1
        model_nameQuery = 'noresm2_mm';  
    case m.norvegia2
        model_nameQuery = 'noresm2_lm'; 
       
    %Modelli Inglesi
    case m.inghilterra1
        model_nameQuery = 'hadgem3_gc31_ll';
    case m.inghilterra2
        model_nameQuery = 'hadgem3_gc31_mm';

    %Modelli Svizzeri
    case m.svizzera1
        model_nameQuery = 'mpi_esm_1_2_ham';

end

end

