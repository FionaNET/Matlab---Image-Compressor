%GetRGBValuesforPoints
%Purpose: Retrieving RGB values for 'k' number of points
%Inputs  1)3D image array to fetch data from 'A'
%        2)2D array identifying which points to extract for 'points'
%Outputs 1)3D array containing k rows, 1 column, 3 layers 'seedMeans'
%Fiona Lin

function seedMeans=GetRGBValuesForPoints(A,points)

[m,~] = size(points);
%Preallocation of 'seedMeans'
seedMeans = zeros(m,1,3);

%Cycling through the 'k' number of rows
for i = 1:m
    %Column 1 in 'points' gives row position
    %Column 2 in 'points' gives column position
    row = points(i,1);
    col = points(i,2);
    %Extract the color data from 'A' using the 'points' and storing.
    seedMeans(i,1,1) = A(row, col, 1);
    seedMeans(i,1,2) = A(row, col, 2);
    seedMeans(i,1,3) = A(row, col, 3);
end
end