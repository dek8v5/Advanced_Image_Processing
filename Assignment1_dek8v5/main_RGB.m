%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%          Dewi Endah Kharismawati               %
%          14231619 / dek8v5                     %
%          Assignment 1                          %
%          Maximum Entropy Threshold             %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

clc;
clear;
close all;

img = imread('mosaic_kernel2.png');
img_ori = img;
[row,col,channel] = size(img);

gt = imread('kernel_mask.png');
gt = gt*255;


%call the max entropy treshold function
tresh1 = MaxEnT(img(:,:,1));
tresh2 = MaxEnT(img(:,:,2));
tresh3 = MaxEnT(img(:,:,3));

img_mask1 = (img(:,:,1)>tresh1);
img_mask2 = (img(:,:,2)>tresh2);
img_mask3 = (img(:,:,3)>tresh3);

img_mask = img_mask1 | img_mask2 | img_mask3;
img_mask = img_mask*255;

%dispay
figure,
subplot(1,2,1)
imshow(img_ori);
title('original image');

subplot(1,2,2)
imshow(img_mask);
title(sprintf('Treshold of this image is R=%d G=%d B=%d', tresh1, tresh2, tresh3));


%compare with otsu threshold
otsu_thresh = graythresh(img);
otsu_thresh=otsu_thresh*256;
mask2 = img>otsu_thresh;
mask2 = mask2*255;


%dispay
figure,
subplot(1,2,1)
imshow(img_ori);
title('original image');

subplot(1,2,2)
imshow(mask2);
title(sprintf('Otsu Treshold of this image is %d', ceil(otsu_thresh)));

% figure,
% hold on
% imhist(img(:,:,1));
% plot([tresh1 tresh1], ylim, '--r', 'LineWidth',2);
% plot([otsu_thresh otsu_thresh], ylim, '--g', 'LineWidth',2);
% legend({'Histogram'; sprintf('Max Entropy Threshold (%d)', tresh1); sprintf('Otsu Threshold (%d)', ceil(otsu_thresh))})
% hold off;

disp(sprintf('max entrophy threshold %d', tresh1));

disp(sprintf('otsu threshold %d', ceil(otsu_thresh)));

[tp, tn, fp, fn] = evaluations(img_mask, gt);
accuracy_maxent=(tp+tn)/(tp+tn+fp+fn);
disp(sprintf('accuracy max entropy threshold is %.2d', accuracy_maxent*100));


% [tp, tn, fp, fn] = evaluations(mask2, gt);
% accuracy_otsu=(tp+tn)/(tp+tn+fp+fn);
% disp(sprintf('accuracy otsu threshold is %.2d', accuracy_otsu*100));







