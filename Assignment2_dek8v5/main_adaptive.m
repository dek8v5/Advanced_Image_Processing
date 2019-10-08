%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%          Dewi Endah Kharismawati               %
%          14231619 / dek8v5                     %
%          Assignment 2                          %
%          Median Filters                        %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% 
clc;
clear;
close all;

img = imread('ABQ_60pNoise.tif');
img_ori = img;
img_gt = double(imread('ABQ.tif'));

%define max and min window size
window_max = 25;
window_min = 3;



[row, col, channel] = size(img);

%define window size here IT NEEDS TO BE AN ODD NUMBER
for window_max_curr = 3:2:window_max
    half = floor(window_max_curr/2);
    middle = ceil(window_max_curr*window_max_curr/2);
    
    cropped = img_gt(half+1:row-half, half+1:col-half);
    
    disp(sprintf('window max %d', window_max_curr));
    tic
    [img_result] = adaptive_med_filt(img, window_min, window_max_curr);
    toc
    t(floor(window_max_curr/2)) = toc;
   
    rmse(floor(window_max_curr/2))= RMSE(img_result, cropped);

    disp(sprintf('RMSE = %.4f', rmse(floor(window_max_curr/2))));
    
    if window_max_curr == 3 || window_max_curr ==15 || window_max_curr ==25
        figure,
        hist(img_result(:)-cropped(:));
        title(sprintf('hist of image diff in window max curr = %d', window_max_curr));

        figure,
        subplot(1,2,1);
        imshow(uint8(img_ori));
        title('original image');

        subplot(1,2,2);
        imshow(uint8(img_result));
        title(sprintf('filtered image with window size = %d', window_max_curr));

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





