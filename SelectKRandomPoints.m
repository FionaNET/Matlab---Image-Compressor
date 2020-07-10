%SelectKRandomPoints
%Purpose: Generates a list of 'k' randomly selected pixels from an image
%Inputs  1)3D image array to select points from 'A'
%        2)Number of points to select 'k'
%Outputs 1)2d array containing k rows and 2 columns 'points'
%Fiona Lin

function [points]=SelectKRandomPoints(A,k)

[m,n,~] = size(A);
%Preallocating 'Points'
points=zeros(k, 2);

%Selecting 'k' number of points
for i=1:k
    %Random value for row and column
    rows=randi([1 m]);
    cols=randi([1 n]);
    %First number can be put in directly (no repeats)
    if i==1
        points(i,1)=rows;
        points(i,2)=cols;
    else
        %Checking match for values
        %setting j=1 as minimum value of i is going to be 1
        j=1;
        %sets j to continously loop to check through all previous values
        while j<i
            %If match is found - randomize values ago
            if  rows==points(j,1) && cols==points(j,2)
                rows=randi([1 m]);
                cols=randi([1 n]);
                %resets while loop to check again through all values
                j=0;
            end
            %increasing to check through all values up until the 'i' value
            j=j+1;
        end
        %If it does not both equal, then the point is unique and is stored
        points(i,1)=rows;
        points(i,2)=cols;
    end
end
end