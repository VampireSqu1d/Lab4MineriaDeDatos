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

%datos sin etiqueta de clase
irisTrain = irisCSVCorregido;
irisTrain(:, 5) = [];
irisTrainx10 = irisTrain * 10;

%se llama a la funcion para generar las coordenadas aleatorias iniciales de
%los centroides
Cantidad = 3;
Clusters = GenerarPosicionClusters(Cantidad, irisTrainx10) / 10;

grosor = 10;
tipoLinea = ".";
%gráfica de los tamaños de los pépalos
% figure(1)
% hold on
% plot(SetosaDatos(:,3),SetosaDatos(:,4), tipoLinea, 'color', 'blue', 'MarkerFaceColor', 'blue', 'MarkerSize', grosor);
% plot(VersicolourDatos(:,3),VersicolourDatos(:,4), tipoLinea, 'color', 'red', 'MarkerFaceColor', 'red', 'MarkerSize', grosor);
% plot(VirginicaDatos(:,3),VirginicaDatos(:,4), tipoLinea, 'color', '#7E2F8E', 'MarkerFaceColor', '#7E2F8E', 'MarkerSize', grosor);
% plot(Clusters(:,3),Clusters(:,4), tipoLinea, 'color', 'green', 'MarkerFaceColor', '#7E2F8E', 'MarkerSize', grosor);
% title("Pépalos");
% hold off
% %gráfica de los tamaños de los sépalos
% figure(2)
% hold on
% plot(SetosaDatos(:,1),SetosaDatos(:,2), tipoLinea, 'color', 'blue', 'MarkerFaceColor', 'blue', 'MarkerSize', grosor);
% plot(VersicolourDatos(:,1),VersicolourDatos(:,2), tipoLinea, 'color', 'red', 'MarkerFaceColor', 'red', 'MarkerSize', grosor);
% plot(VirginicaDatos(:,1),VirginicaDatos(:,2), tipoLinea, 'color', '#7E2F8E', 'MarkerFaceColor', '#7E2F8E', 'MarkerSize', grosor);
% plot(Clusters(:,1),Clusters(:,2), tipoLinea, 'color', 'green', 'MarkerFaceColor', '#7E2F8E', 'MarkerSize', grosor);
% title("Sépalos");
% hold off

ClusterLabels = asignarclusters(irisTrain,Clusters);


Clusters = RecalcularCentroides(irisTrain,ClusterLabels);





