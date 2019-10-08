function [M,P] = ComputeMinEnergy(e)
% e: edge energy. Matrix of size (rows x col)
% M: min energy matrix. Matrix of size (rows x col)
% P: path matrix. Matrix of size (rows x col),
%           values: -1: left, 0: up, +1:right
% M should be updated recursively as described in lecture notes
% Try to vectorize the update function, try to avoid looping over each
% and every pixel. Hint: M(i,j), depends on
% e(i,j), M(i-1,j-1),M(i-1,j),M(i-1,j+1)

[row, col] = size(e);

M = zeros(row,col);
P = zeros(row,col);

M(1:2,:) = e(1:2,:);
M(:,1) = inf;
M(:,col) = inf;


for i = 3:row
    for j = 2:col-1
        [mini, I] = min([M(i-1, j-1), M(i-1, j), M(i-1, j+1)]);
        M(i,j) = e(i,j) + mini;
        P(i,j) = I-2;
    end
end
end

