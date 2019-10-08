function[e]=InitializeEdgeEnergy(im)
% im: input image color or gray scale. Matrix of size (rows x col x channels)
% e: edge energy. Matrix of size (rows x col)
im = padarray(im, [1 1], 0, 'both');
[row, col] = size(im);
e = zeros(row,col);

for i=2:row
    for j=2:col
        e(i,j) = abs(im(i,j)-im(i,j-1)) + abs(im(i,j)-im(i-1,j));
    end
end
end

