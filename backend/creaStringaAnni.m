function [year] = creaStringaAnni(startYear,endYear)
%Crea la stringa contente gli anni selezionati da passare alla richiesta

year = [''];
for i = startYear:1:endYear
    anno = [num2str(i),'-'];
    year = strcat(year,anno);
end
year = strsplit(year,'-');
year = string(year);
year(end) = [];

end

