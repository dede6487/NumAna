function [F, DF] = slowFun(x)
% n = 1  
    F = exp(-x);
    DF = -exp(-x);
end