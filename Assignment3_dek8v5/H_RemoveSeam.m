function [im2] = H_RemoveSeam(im,rlist,clist)

% im: input image color or gray scale. Matrix of size (rows x col x channels)

% rlist,clist: coordinates of the points to be removed from the image

% im2: carved image color or gray scale. Matrix of size (rows-1 x col x channels) or (rows x cols-1 x channels)

[row,col,channel] = size(im);
im2 = zeros(row-1,col,channel);

for i=1:3
    channel_curr = im(:,:,i);
    ind = sub2ind(size(channel_curr), rlist, clist);
    img_flat = channel_curr(:);
    img_flat(ind) = [];
    im2(:,:,i) = reshape(img_flat, [], col);
end
end

