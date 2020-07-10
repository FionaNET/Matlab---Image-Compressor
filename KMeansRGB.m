% KMeansRGB
% Inputs  1) 3D array containing an RGB image 'A'
%         2) 3D array (K x 1 x 3) containing the seed mean 'seedMeans'
%         3) The maximum number of iterations to perform. 'maxIterations'
% Outputs 1) 2D array (m x n) specifying cluster group 'clusters'
%         2) 3D array (k x 1 x 3) where row kcontains the mean
%           colour values for cluster k. The mean R,G,B values for
%           cluster k will be stored in row k 'means'
%Fiona Lin

function [clusters, means] = KMeansRGB(A,seedMeans,maxIterations)

%Preallocating 'means'
[k,~,~] = size(seedMeans);
means = zeros(k,1,3);

%Going through for number of maxiterations.
for i = 1:maxIterations
    %AssigntoClusters Step - Already goes through pixel by pixel
    clusters = AssignToClusters(A,seedMeans);
    %UpdateMeans Step - %New means calculated for each cluster.
    means = UpdateMeans(A,k,clusters);
    %Break if the mean converges.
    if seedMeans == means
        break
    else
        seedMeans = means;
    end
end
end

