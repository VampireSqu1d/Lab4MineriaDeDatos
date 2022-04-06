function [outputArg1] = Precision(Clusters, Sa, Ve, Vi)
% En esta función se cálcula que cluster se adecúa más a que clase y se le
% asigna, además se cálcula el porcentaje de precision.

z = size(Clusters,1);
Labels = zeros(z,1);
presicion = zeros(z,1);
Sa(5) = [];
Ve(5) = [];
Vi(5) = [];

% for para calcular la presicion de cada clase y la sicgnacion del cluster
% con la clase que le corresponde
for c=1: z
    tempMean = sum(Clusters(c,:));
    Labels(c, 1) = 1;
    %se calcula la presicion del cluster con cada clase
    aa = (tempMean/ sum(Sa)) *100;
    ee = (tempMean/ sum(Ve)) *100;
    ii = (tempMean/ sum(Vi)) *100;
    presicion(c, 1) = aa;
    % si la presicion con la clase 2 es mayor se reasigna
    if abs(ee-100) < abs(presicion(c, 1)-100)
        Labels(c, 1) = 2;
        presicion(c, 1) = ee;
    end
    % si la presicion con la clase 3 es mayor se reasigna
    if abs(ii-100) < abs(presicion(c, 1)-100)
        Labels(c, 1) = 3;
        presicion(c, 1) = ii;
    end
    
end
%for para correcciones de la presicion
for j=1: size(presicion)
    if presicion(j,1) > 100
        temp = presicion(j,1) - 100;
        presicion(j,1) = 100 - temp;
    end
end



outputArg1 = [Clusters Labels presicion];
end

