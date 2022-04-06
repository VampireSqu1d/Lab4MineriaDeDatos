function [FScores] = FScore(ClustersLabeled)
% esta funcion calcula los F-score de cada clase con los valores de
% precision y recall de la matriz de clusters
FScores = zeros(size(ClustersLabeled,1), 1);
%       F-score
%       F-score = 2 * Precision * Recall / (Precision + Recall)
i = size(ClustersLabeled,1);
for c=1: i
    precision = ClustersLabeled(c,6);
    recall = ClustersLabeled(c,7);
    FScores(c,1) = (2 * precision * recall) /( precision + recall);
end
end

