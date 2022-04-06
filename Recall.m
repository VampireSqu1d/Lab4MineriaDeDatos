function [Recalls] = Recall(CantidadClases, ClusterLabels, irisCSVCorregido)
%en esta funcion se calcula el recall de cada clase con los labels
%calculados y los reales

%aqui se declaran las mmatrices necesarias y se llenan con ceros
trueSizes = zeros(CantidadClases,1);
CalcSizes = zeros(CantidadClases,1);
Recalls = zeros(CantidadClases,1);
%aqui se llenan las matrices con las cantidades de cada clase
for c=1:CantidadClases
    Mapa = irisCSVCorregido(:,5)== c;
    trueSizes(c,1) = size(irisCSVCorregido((Mapa), :),1);
    MapaCalc = ClusterLabels(:,1) == c;
    CalcSizes(c,1) = size(ClusterLabels((MapaCalc), :),1);
end
%   Recall
%   Recall = true_positive / (true_positive + false_negative)
for z=1:size(Recalls,1)
        false_negative = abs(trueSizes(z,1) - CalcSizes(z,1));
        Recalls(z,1) = trueSizes(z,1) / (trueSizes(z,1) + false_negative);
end


end

