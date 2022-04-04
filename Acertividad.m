function [outputArg1] = Acertividad(Clusters, Sa, Ve, Vi)
% En esta función se cálcula que cluster se adecúa más a que clase y se le
% asigna, además se cálcula el porcentaje de acetividad.

z = size(Clusters,1);
Labels = zeros(z,1);
acertividad = zeros(z,1);
Sa(5) = [];
Ve(5) = [];
Vi(5) = [];

for c=1: z
    tempMean = mean(Clusters(c,:));
    Labels(c, 1) = 1;
    
    aa = (tempMean/ mean(Sa)) *100;
    ee = (tempMean/ mean(Ve)) *100;
    ii = (tempMean/ mean(Vi)) *100;
    acertividad(c, 1) = aa;
    eee = abs(ee-100);
    if eee < abs(acertividad(c, 1)-100)
        Labels(c, 1) = 2;
        acertividad(c, 1) = ee;
    end
    if abs(ii-100) < abs(acertividad(c, 1)-100)
        Labels(c, 1) = 3;
        acertividad(c, 1) = ii;
    end
end

for j=1: size(acertividad)
    if acertividad(j,1) > 100
        temp = acertividad(j,1) - 100;
        acertividad(j,1) = 100 - temp;
    end
end

outputArg1 = [Clusters Labels acertividad];
end

