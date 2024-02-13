function [T] = convertiDate(time,startYear)
%Converte le date espresse in double in dateTime

n = size(time,1);
k = 1;
for i = 1 : 5 : n
    if(k <= n/5)
        T(i)   = datetime(startYear-1+k, 1 , 1);
        T(i+1) = datetime(startYear-1+k, 2 , 1);
        T(i+2) = datetime(startYear-1+k, 3 , 1);
        T(i+3) = datetime(startYear-1+k, 4 , 1);
        T(i+4) = datetime(startYear-1+k, 12, 1);
    end
    k = k+1;
end

T = T';

indicesDaRimuovere = T < datetime(2015, 1, 1);
T = T(~indicesDaRimuovere);
indicesDaRimuovere = T > datetime(2101, 1, 1);
T = T(~indicesDaRimuovere);

end

