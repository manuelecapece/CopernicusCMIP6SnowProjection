% matrix = [1 0 3; 0 0 0; 4 0 6; 0 0 0; 0 0 0];
% 
% 
% zeroRows = all(matrix == 0, 2)
% 
% matrix(:,:,2) = matrix
% 
% matrix(zeroRows, :,:) = [];
% 
% matrix

%%%%%%%%%%%%
matrix = [1 5 3; 5 3 5; 4 8 6; 6 6 8; 5 7 3];
matrix(:,:,2) = matrix

m = [1,0,1,0,1]'

matrix3 = matrix .* m

zeroRows = all(matrix3(:,:,1) == 0, 2)

matrix3(zeroRows, :,:) = []




