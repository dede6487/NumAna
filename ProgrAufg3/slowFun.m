function [F, DF] = slowFun(x)
% n = 2    
    F = exp(-x);
    DF = -exp(-x);
end