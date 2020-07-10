%CreateKColorImage
% Inputs 1)2D array (m x n) specifying cluster group 'clusters'
%        2)3D array (k x 1 x 3) where row k contains mean RGB values for
%        cluster k 'means'
% Output 1)3D array (m x n x 3) of unsigned 8 bit integers (uint8)
%          representing an RGB image. 'B'
%          Color in B determined by the mean RGB values for that cluster.
%          All pixels in cluster k will be coloured using the RGB values
%          from row k of 'means'
%Fiona Lin

function B= CreateKColourImage(clusters,means)

%Going through whole image
[rows,cols]=size(clusters);
%Preallocation of image array
B=zeros(rows,cols,3); 

for i=1:rows
    for j=1:cols
        %Setting Color in image 'B'
        B(i,j,1)=means(clusters(i,j),1,1);
        B(i,j,2)=means(clusters(i,j),1,2);
        B(i,j,3)=means(clusters(i,j),1,3);
    end
end

B=round(B);
B=uint8(B);

end