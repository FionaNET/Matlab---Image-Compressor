% UpdateMeans
% Used by KMeansRGB
% Purpose:Calculate the mean values for each cluster
% Inputs 1)A 3D array containing an RGB image 'A'
%        2)A single value specifying how many clusters there are 'k'
%        3)A 2D array of m x n specifying cluster group 'clusters'
% Output 1)3D array (k x 1 x 3) containing the mean values for each cluster.
%          The mean R, G and B values for cluster k will be
%          stored in row k and layer 1,2,3 respectively.
%Fiona Lin

function [means] = UpdateMeans(A,k,clusters)

%Pre-allocating 'means'
means=zeros(k,1,3);
[row,cols]=size(clusters);

for i=1:k
    %Counter to find average later
    a=0;
    for r=1:row
        for c=1:cols
            %Picking out 1 cluster at a time through entire image
            if i==clusters(r,c)
                %Increase counter to find average later
                a=a+1;
                %Storing into color arrays
                red(i,a)=A(r,c,1);
                green(i,a)=A(r,c,2);
                blue(i,a)=A(r,c,3);
            end
        end
    end
    %Calculating average and storing into 'means'
    means(i,1,1) = sum(red(i,:))/a;
    means(i,1,2) = sum(green(i,:))/a;
    means(i,1,3) = sum(blue(i,:))/a;
end
end