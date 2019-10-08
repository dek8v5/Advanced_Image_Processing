function [im2] = RemoveSeam(im,rlist,clist)

% im: input image color or gray scale. Matrix of size (rows x col x channels)

% rlist,clist: coordinates of the points to be removed from the image

% im2: carved image color or gray scale. Matrix of size (rows-1 x col x channels) or (rows x cols-1 x channels)

[row,col,channel] = size(im);
im2 = zeros(row,col-1,channel);

for i=1:3
    channel_curr = im(:,:,i);
    channel_curr = channel_curr';
    ind = sub2ind(size(channel_curr), clist, rlist);
    img_flat = channel_curr(:);
    img_flat(ind) = [];
    im2(:,:,i) = reshape(img_flat', [], row)';
end
end

%keatas

% A = [1,2,3;4,5,6;7,8,9;10,11,12;13,14,15]
% A = A'
% B = [1,3;2,1;3,2;4,3;5,2]
% 
% x = B(:,1)
% 
% z = B(:,2)
% 
% 
% 
% ind = sub2ind(size(A), z, x)
% 
% A(ind) = []
% 
% A = reshape(A', [], length(x))'
