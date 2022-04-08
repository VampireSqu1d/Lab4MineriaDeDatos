function [CoordenadasCentroides] = RecalcularCentroides(Train,ClusterLabels)
    CoordenadasCentroides = zeros(3,4);
    Labeled = [Train ClusterLabels];

    MapaSetosa = Labeled(:,5)==1;
    SetosaCluster = Train((MapaSetosa), :);
    MapaVersicolour = Labeled(:,5)==2;
    VersicolourCluster = Train((MapaVersicolour), :);
    MapaVirginica = Labeled(:,5)==3;
    VirginicaCluster = Train((MapaVirginica), :);

    CoordenadasCentroides(1,:) = mean(SetosaCluster);
    CoordenadasCentroides(2,:) = mean(VersicolourCluster);
    CoordenadasCentroides(3,:) = mean(VirginicaCluster);

end

