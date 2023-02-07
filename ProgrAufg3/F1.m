function [ F, DF ] = F1( x )
%F1 Summary of this function goes here
%   Detailed explanation goes here
    F= zeros(2,1);
    F(1) = exp(x(2)) - x(1)*x(1);
    F(2) =  5 * x(2) +sin (x(2))  + 4*x(1);
    DF(1,1)=-2*x(1);
    DF(1,2)= exp(x(2));
    DF(2,2)=5+cos(x(2));
    DF(2,1)=4;
end