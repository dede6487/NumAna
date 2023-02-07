function [ F, DF ] = noRoot( x )
% n = 1
    F = x.*x + 1;
    DF = 2.*x;
end

