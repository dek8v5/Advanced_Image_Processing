function [rlist,clist]=H_TraverseP(P,r0,c0)
% P: path matrix computed as above

% r0,c0: first point of the optimal seam (location of minimum M value in last 
% row when you remove columns and minimum value in last column when you
% remove rows).

% rlist,clist: coordinates of the points to be removed from the image

[row, col] = size(P);
rlist = zeros(col,1);
clist = zeros(col,1);

rlist(col) = r0;
clist(col) = c0;
value_P = P(r0,c0);
for i = col-1:-1:1
    rlist(i) = r0 + value_P;
    clist(i) = i;
    value_P = value_P+P(rlist(i),i);
end
end

