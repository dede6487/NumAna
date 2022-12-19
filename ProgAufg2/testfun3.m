function [y] = testfun3 (x)
%takes a vector of x and gives a vector y with the corresponding function values

y = zeros(length(x),1);

for i = 1:length(x)
    y(i) = exp(x(i)) - x(i)*x(i)/2;
end  
