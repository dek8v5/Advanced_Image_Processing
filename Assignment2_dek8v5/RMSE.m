function [ result ] = RMSE( img, gt )
%Ucalculating RMSE between 2 images

result = sqrt(mean((img(:)-gt(:)).^2));

end

