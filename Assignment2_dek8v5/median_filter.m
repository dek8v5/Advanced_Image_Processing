function [img_result ] = median_filter( img, window_size )
% median_filter 

img = double(img);

[row, col, channel] = size(img);

%convert to greyscale if image is rgb
if channel>1
    img = rgb2gray(img);
end

half = floor(window_size/2);
middle = ceil(window_size*window_size/2);


img_result=zeros(row,col);


for x = half+1:row-half
    for y = half+1:col-half
        aoi = img(x-half:x+half, y-half:y+half);
        sorted_aoi = sort(reshape(aoi, 1, window_size*window_size));
        median = sorted_aoi(middle);
        img_result(x,y) = median;
    end
end

img_result = img_result(half+1:row-half, half+1:col-half);

end

