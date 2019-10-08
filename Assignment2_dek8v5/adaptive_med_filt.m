function [ result_img ] = adaptive_med_filt( img, window_min, window_max )

half_win = floor(window_max/2);

[row, col] = size(img);


img = double (img);

curr_half_floor = floor(window_min/2);

for i=half_win+1:row-half_win
    for j=half_win+1:col-half_win
        current_window = window_min;
        while (current_window<=window_max)
            curr_half_floor = floor(current_window/2);
            middle = ceil(current_window^2/2);
            aoi = img(i-curr_half_floor:i+curr_half_floor, j-curr_half_floor:j+curr_half_floor);
            sorted_aoi = sort(aoi(:));

            Z_min = sorted_aoi(1);
            Z_max = sorted_aoi(current_window*current_window);
            Z_med = sorted_aoi(middle);

            A1 = Z_med-Z_min;
            A2 = Z_med-Z_max;

            if (A1>0) && (A2<0)
                %level B
               	B1 = img(i,j) - Z_min;
                B2 = img(i,j) - Z_max;
                if (B1>0) && (B2<0)
                    result_img(i,j) = img(i,j);
                    break
                else
                    result_img(i, j) = Z_med;
                    break
                end 
            else 
                current_window = current_window+2;
                if current_window>window_max
                     result_img(i, j) = Z_med;
                end 
            end
        end 
        window_used(i,j) = current_window;
        
    end 
end 
figure,
hold on;
histogram(window_used(half_win+1:row-half_win, half_win+1:col-half_win));
xlabel('window size');
ylabel('frequency');
title('histogram of window size used in each pixel');
hold off;

result_img = result_img(half_win+1:row-half_win, half_win+1:col-half_win);

end

