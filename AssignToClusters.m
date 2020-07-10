%AssignToClusters
%Used by KMeansRGB
%Purpose:Assigns each point to a cluster, based on which mean
%that point is closest to by calculating squared distance
%Inputs  1) 3D array containing an RGB %image 'A'
%        2)3d Array containing color information 'RGBvalues'
%Outputs 1)2D array with m rows and n columns that contain the
%cluster number for each pixel. 'clusters'
%Fiona Lin

function [clusters] = AssignToClusters(A,seedMeans)

[m,n,~]=size(A);
%Preallocation of cluster
clusters=zeros(m,n);
%Assigning Seedmeans to points that can be compared for.
k=length(seedMeans);

for row=1:m
    for cols=1:n
        pixelpoint=A(row,cols,:);
        %preset lowest for later comparison
        lowest=inf;
        for i=1:k
            %Setting as Q for point of comparison.
            %Setting as 'P' for point 2 of comparison
            Q=seedMeans(i,1,:);
            P=pixelpoint;
            %cluster number (i.e 1 2 3) determined by calculating squared
            %dist.
            current=((P(1,1,1)-Q(1,1,1)).^2)+((P(1,1,2)-Q(1,1,2)).^2)+((P(1,1,3)-Q(1,1,3)).^2);
            %If distance=same between 2 points, then lower cluster number is chosen
            if current<lowest
                lowest=current;
                clustergroup=i;
            end
        end
        %Storing Clusters
        clusters(row,cols)=clustergroup;
    end
end
end