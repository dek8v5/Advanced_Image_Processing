%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%          Dewi Endah Kharismawati               %
%          14231619 / dek8v5                     %
%          Assignment 3                          %
%          Seam Carving                          %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

clc;
clear;
close all;


img = imread('image1.jpg');


max_iter = 200; %number of iteration
direction = 'vertical'; %can be vertical, horizontal, v_h, or h_v 


if strcmp(direction, 'vertical')
    tic
    img_carved = main_v(img, max_iter);
    toc
elseif strcmp(direction, 'horizontal')
    tic
    img_carved = main_h(img, max_iter);
    toc
elseif strcmp(direction, 'v_h')
    tic
    img_carved = main_v(img, max_iter);
    img_carved = main_h(img_carved, max_iter);
    toc
elseif strcmp(direction, 'h_v');
    tic
    img_carved = main_h(img, max_iter);
    img_carved = main_v(img_carved, max_iter);
    toc
end




