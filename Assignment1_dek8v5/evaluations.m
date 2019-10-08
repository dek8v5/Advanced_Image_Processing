function [tp, tn, fp, fn] = evaluations(mask, ground_truth)
%UNTITLED6 Summary of this function goes here
%   Detailed explanation goes here

tp = mask & ground_truth;
fp = mask & (~tp);
tn = ~(mask | ground_truth);
fn = mask & (~tp);

tp = sum(tp(:));
fp = sum(fp(:));
tn = sum(tn(:));
fn = sum(fn(:));


end

