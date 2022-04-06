% Setosa == 1 % Versicolour == 2 % Virginica == 3
%se dividen los datos en matrices dependiendo de su clase
MapaSetosa = irisCSVCorregido(:,5)==1;
SetosaDatos = irisCSVCorregido((MapaSetosa), :);
MapaVersicolour = irisCSVCorregido(:,5)==2;
VersicolourDatos = irisCSVCorregido((MapaVersicolour), :);
MapaVirginica = irisCSVCorregido(:,5)==3;
VirginicaDatos = irisCSVCorregido((MapaVirginica), :);
Sa= mean(SetosaDatos);
Ve= mean(VersicolourDatos);
Vi= mean(VirginicaDatos);
MediasReales = [Sa; Ve; Vi];

figure(1)
hold on
plot(SetosaDatos(:,3),SetosaDatos(:,4), tipoLinea, 'color', 'blue', 'MarkerFaceColor', 'blue', 'MarkerSize', grosor);
plot(VersicolourDatos(:,3),VersicolourDatos(:,4), tipoLinea, 'color', 'red', 'MarkerFaceColor', 'red', 'MarkerSize', grosor);
plot(VirginicaDatos(:,3),VirginicaDatos(:,4), tipoLinea, 'color', '#7E2F8E', 'MarkerFaceColor', '#7E2F8E', 'MarkerSize', grosor);
plot(MediasReales(:,3),MediasReales(:,4), tipoLinea, 'color', 'green', 'MarkerFaceColor', '#7E2F8E', 'MarkerSize', grosor);
title("Pépalos");
hold off
%gráfica de los tamaños de los sépalos
figure(2)
hold on
plot(SetosaDatos(:,1),SetosaDatos(:,2), tipoLinea, 'color', 'blue', 'MarkerFaceColor', 'blue', 'MarkerSize', grosor);
plot(VersicolourDatos(:,1),VersicolourDatos(:,2), tipoLinea, 'color', 'red', 'MarkerFaceColor', 'red', 'MarkerSize', grosor);
plot(VirginicaDatos(:,1),VirginicaDatos(:,2), tipoLinea, 'color', '#7E2F8E', 'MarkerFaceColor', '#7E2F8E', 'MarkerSize', grosor);
plot(MediasReales(:,1),MediasReales(:,2), tipoLinea, 'color', 'green', 'MarkerFaceColor', '#7E2F8E', 'MarkerSize', grosor);
title("Sépalos");
hold off

%datos sin etiqueta de clase
irisTrain = irisCSVCorregido;
irisTrain(:, 5) = [];
irisTrainx10 = irisTrain * 10;
%se llama a la funcion para generar las coordenadas aleatorias iniciales de
%los centroides
k = 3;
Clusters = GenerarPosicionClusters(k, irisTrainx10) / 10;

grosor = 10;
tipoLinea = ".";
%gráfica de los tamaños de los pépalos
figure(3)
hold on
plot(SetosaDatos(:,3),SetosaDatos(:,4), tipoLinea, 'color', 'blue', 'MarkerFaceColor', 'blue', 'MarkerSize', grosor);
plot(VersicolourDatos(:,3),VersicolourDatos(:,4), tipoLinea, 'color', 'red', 'MarkerFaceColor', 'red', 'MarkerSize', grosor);
plot(VirginicaDatos(:,3),VirginicaDatos(:,4), tipoLinea, 'color', '#7E2F8E', 'MarkerFaceColor', '#7E2F8E', 'MarkerSize', grosor);
plot(Clusters(:,3),Clusters(:,4), tipoLinea, 'color', 'green', 'MarkerFaceColor', '#7E2F8E', 'MarkerSize', grosor);
title("Pépalos");
hold off
%gráfica de los tamaños de los sépalos
figure(4)
hold on
plot(SetosaDatos(:,1),SetosaDatos(:,2), tipoLinea, 'color', 'blue', 'MarkerFaceColor', 'blue', 'MarkerSize', grosor);
plot(VersicolourDatos(:,1),VersicolourDatos(:,2), tipoLinea, 'color', 'red', 'MarkerFaceColor', 'red', 'MarkerSize', grosor);
plot(VirginicaDatos(:,1),VirginicaDatos(:,2), tipoLinea, 'color', '#7E2F8E', 'MarkerFaceColor', '#7E2F8E', 'MarkerSize', grosor);
plot(Clusters(:,1),Clusters(:,2), tipoLinea, 'color', 'green', 'MarkerFaceColor', '#7E2F8E', 'MarkerSize', grosor);
title("Sépalos");
hold off

for c=1:k
    ClusterLabels = asignarclusters(irisTrain,Clusters);
    Clusters = RecalcularCentroides(irisTrain,ClusterLabels);
end

% gráficas de los clusters despúes de aplicar el algóritmo k-means
% gráfica de los tamaños de los pépalos
figure(5)
hold on
plot(SetosaDatos(:,3),SetosaDatos(:,4), tipoLinea, 'color', 'blue', 'MarkerFaceColor', 'blue', 'MarkerSize', grosor);
plot(VersicolourDatos(:,3),VersicolourDatos(:,4), tipoLinea, 'color', 'red', 'MarkerFaceColor', 'red', 'MarkerSize', grosor);
plot(VirginicaDatos(:,3),VirginicaDatos(:,4), tipoLinea, 'color', '#7E2F8E', 'MarkerFaceColor', '#7E2F8E', 'MarkerSize', grosor);
plot(Clusters(:,3),Clusters(:,4), tipoLinea, 'color', 'green', 'MarkerFaceColor', '#7E2F8E', 'MarkerSize', grosor);
title("Pépalos");
hold off
%gráfica de los tamaños de los sépalos
figure(6)
hold on
plot(SetosaDatos(:,1),SetosaDatos(:,2), tipoLinea, 'color', 'blue', 'MarkerFaceColor', 'blue', 'MarkerSize', grosor);
plot(VersicolourDatos(:,1),VersicolourDatos(:,2), tipoLinea, 'color', 'red', 'MarkerFaceColor', 'red', 'MarkerSize', grosor);
plot(VirginicaDatos(:,1),VirginicaDatos(:,2), tipoLinea, 'color', '#7E2F8E', 'MarkerFaceColor', '#7E2F8E', 'MarkerSize', grosor);
plot(Clusters(:,1),Clusters(:,2), tipoLinea, 'color', 'green', 'MarkerFaceColor', '#7E2F8E', 'MarkerSize', grosor);
title("Sépalos");
hold off

ClustersLabeled = Precision(Clusters, Sa, Ve, Vi);

precisionTotal = mean(ClustersLabeled(:,6));
ClustersLabeled =[ ClustersLabeled Recall(3, ClusterLabels, irisCSVCorregido)];

ClustersLabeled = [ClustersLabeled FScore(ClustersLabeled)];









