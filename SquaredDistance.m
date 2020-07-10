%SquaredDistance
%Purpose:Calculates the square of the distance between 2 points in 3D space
%Inputs: 1)Array containing 3 elements representing point in 3D space 'P'
%        2)Array containing 3 elements representing point 2 in 3D space 'Q'
%Output: 1)Square of the distance between 2 points in 3D space 'squared
%dist'
%Formula: D=(p1-Q1)^2+(P2-Q2)^2+(p3-Q3)^2
%Should be able to handle if
%P&Q are: 1x3
%       : 3x1
%       : 1x1x3 arrays (where each layer contains a color value)
%Fiona Lin

function squareddist=SquaredDistance(P,Q)

[x,y,~]=size(P);

%Checking size of array
if (x==1 && y==3) || (x==3 && y==1)
    squareddist=((P(1)-Q(1)).^2)+((P(2)-Q(2)).^2)+((P(3)-Q(3)).^2);
else
    squareddist =((P(1,1,1)-Q(1,1,1)).^2)+((P(1,1,2)-Q(1,1,2)).^2)+((P(1,1,3)-Q(1,1,3)).^2);
end
end