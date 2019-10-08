%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%          Dewi Endah Kharismawati               %
%          14231619 / dek8v5                     %
%          Assignment 2                          %
%          Median Filters                        %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

clc;
clear;
close all;


img = imread('ABQ_60pNoise.tif');
img_ori = img;
img_gt = double(imread('ABQ.tif'));

[row, col, channel] = size(img);

%define window size here IT NEEDS TO BE AN ODD NUMBER
for window_size = 3:2:25
    half = floor(window_size/2);
    middle = ceil(window_size*window_size/2);
    
    cropped = img_gt(half+1:row-half, half+1:col-half);
    
    disp(sprintf('window_size %d', window_size));
    tic
    [img_result] = medhist_filter(img, window_size);
    toc
    t(floor(window_size/2)) = toc;
   
    rmse(floor(window_size/2))= RMSE(img_result, cropped);

    disp(sprintf('RMSE = %.4f', rmse(floor(window_size/2))));
    
    if window_size == 3 || window_size ==15 || window_size ==25
        figure,
        hist(img_result(:)-cropped(:));
        title(sprintf('hist of image diff in window_size = %d', window_size));

        figure,
        subplot(1,2,1);
        imshow(uint8(img_ori));
        title('original image');

        subplot(1,2,2);
        imshow(uint8(img_result));
        title(sprintf('filtered image with window size = %d', window_size));

    end
    
end


figure,
hold on;
x = 3:2:25;
y = rmse;
z = t;
plot(x,y, '-or')
plot(x,z, '-*b')
title('Window Size vs RMSE')
legend({'RMSE' ; 'Time Elapsed'});
xlabel('window size')
hold off;
