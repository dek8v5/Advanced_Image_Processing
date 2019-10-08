function [thresh_Index] = MaxEnT(img)
%MaxEnT maximum entrophy threshold
%   expecting greyscale image: img

hist = double(imhist(img));

%probability of ach grey level p(i,j) = r(i,j)/(M*N), where r is frequency
%and M,N is the size of the image

[m,n] = size(img);

h_ij_norm = double(hist/(m*n));

h_cum = double(cumsum(h_ij_norm));

%calculate entrophy of white and black pixel
Hb = zeros(1,256);
Hw = zeros(1,256);
for t=1:length(hist)
    if h_cum(t)>0
        ent(1:t) = -(h_ij_norm(1:t)./h_cum(t)).*log((h_ij_norm(1:t)./h_cum(t)));
        ent(isnan(ent))=0;
        Hb(t) = sum(ent);
        
     end
    
    if (1-h_cum(t))>0
        ent_w(t+1:length(hist)) = -((h_ij_norm(t+1:length(hist))./(1-h_cum(t))).*log((h_ij_norm(t+1:length(hist))./(1-h_cum(t)))));
        ent_w(isnan(ent_w))=0;
        Hw(t) = sum(ent_w);
        ent_w=0;
    end
    
        
end

%Select an optimal threshold by max Hb+Hw
H_all = Hb+Hw;
[thresh, thresh_Index] = max(H_all);

figure,
hold on;
% imhist(img);
plot(1:256, transpose(Hb), '-r');
plot(1:256, transpose(Hw), '-b');
plot(1:256, transpose(H_all), '-g');
plot([thresh_Index thresh_Index], ylim, '--r');
legend({'Foreground Entrophy' ; 'Background Entrophy'; 'Combined Entrophy'; sprintf('Max Entropy Threshold (%d)', thresh_Index)})


end




