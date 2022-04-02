function [MatrizClusters] = GenerarPosicionClusters(CantidadClusters, MatrixDatos)
    i = size(MatrixDatos,2 );
    MatrizClusters = zeros( CantidadClusters,i );
    %vectorClusters = [1, CantidadClusters];
    %define límites
    mi = min(MatrixDatos,[],1);
    ma = max(MatrixDatos,[],1);
    for c=1:i
        tempMin = mi(:,c);
        tempMax = ma(:,c);
        s = rng;
        rng(s);
        tempRand = randi([tempMin, tempMax],1,CantidadClusters);
        MatrizClusters(:, c) = tempRand;
    end
end