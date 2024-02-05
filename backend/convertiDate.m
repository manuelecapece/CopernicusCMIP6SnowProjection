function [T] = convertiDate(time)
%Converte le date espresse in double in dateTime

%T = datetime(1850,1,1,'Format','MMM-yyyy') + days(time);

n = size(time,1);
k = 1;
for i = 1 : 5 : n
    if(k <= n/5)
        T(i)   = datetime(2014+k, 1 , 1);
        T(i+1) = datetime(2014+k, 2 , 1);
        T(i+2) = datetime(2014+k, 3 , 1);
        T(i+3) = datetime(2014+k, 4 , 1);
        T(i+4) = datetime(2014+k, 12, 1);
    end
    k = k+1;
end

T = T';

indicesDaRimuovere = T < datetime(2015, 1, 1);
T = T(~indicesDaRimuovere);
indicesDaRimuovere = T > datetime(2101, 1, 1);
T = T(~indicesDaRimuovere);

end

