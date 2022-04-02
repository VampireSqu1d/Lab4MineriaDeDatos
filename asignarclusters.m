function [ClusterLabels] = asignarclusters(Train, Clusters)
    tamanotrain = size(Train, 1);
    tamanoClusters = size(Clusters,1);
    ClusterLabels = zeros(size(Train,1),1);
    
    for c=1: tamanotrain
        currentFlower = Train(c, :); 
        tempDists = zeros(1, tamanoClusters);
        for z=1: tamanoClusters
            currentcluster = Clusters(z, :);
            currentDist = 0;
            for j=1: size(currentcluster,2)
                % registro - centride al cuadrado
                currentDist = (currentFlower(1,j) - currentcluster(1,j))^2;
            end
            tempDists(1, z) = currentDist;
        end
        %ee = find(min(tempDists));
        [val,idx] = min(tempDists);
        ClusterLabels(c,1) = idx;
    end
end
