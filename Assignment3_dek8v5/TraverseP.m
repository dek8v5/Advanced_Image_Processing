function [rlist,clist]=TraverseP(P,r0,c0)
% P: path matrix computed as above

% r0,c0: first point of the optimal seam (location of minimum M value in last 
% row when you remove columns and minimum value in last column when you
% remove rows).

% rlist,clist: coordinates of the points to be removed from the image

[row, col] = size(P);
rlist = zeros(row,1);
clist = zeros(row,1);

rlist(row) = r0;
clist(row) = c0;
value_P = P(r0,c0);
for i = row-1:-1:1
    rlist(i) = i;
    clist(i) = c0 + value_P;
    value_P = value_P+P(i,clist(i));
end
end

