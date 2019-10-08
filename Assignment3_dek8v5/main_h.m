function [img_carved] = main_h( img, max_iter )
%UNTITLED9 Summary of this function goes here
%   Detailed explanation goes here

img_ori = img;
img_ori_ori = img;
img = rgb2gray(img);
img = double(img);

%horizontal
for i = 1:max_iter
    disp(i)
    %compute energy
    e = InitializeEdgeEnergy(img);
    [M,P] = H_ComputeMinEnergy(e);

    %remove col


    %remove all pad
    e = e(2:end-1, 2:end-1);
    M = M(2:end-1, 2:end-1);
    P = P(2:end-1, 2:end-1);

    [row,col] = size(M);
    c0 = col;
    [minimum, r0] = min(M(:,col));


    [rlist,clist] = H_TraverseP(P,r0,c0);

    img_carved = H_RemoveSeam(img_ori,rlist,clist);
    img = uint8(img_carved);
    img_ori = img;
    img = rgb2gray(img);
    img = double(img);


    if i==1
        im_overlay = MarkSeam(img_ori_ori,rlist,clist,[1 0 0],[0 1]);
    end

end

figure,
subplot(1,2,1)
imshow(im_overlay);
title('image ori with mark seam');

subplot(1,2,2)
imshow(uint8(img_carved));
title(sprintf('image carved horizontal %d time', max_iter));
    
end

