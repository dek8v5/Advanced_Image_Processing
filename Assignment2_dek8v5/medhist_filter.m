function [result_images] = medhist_filter(img, window_size)

%img = double(img);

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
        [counts, greylevels] = imhist(aoi);
        
        cum_count = cumsum(counts);
        
        indexes = find(cum_count>=middle);
        median = greylevels(indexes(1));
        img_result(x,y) = median(1);
    end
end

result_images = img_result(half+1:row-half, half+1:col-half);


end

