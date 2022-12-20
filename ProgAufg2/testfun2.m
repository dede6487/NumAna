function [y] = testfun2 (x)
%takes a vector of x and gives a vector y with the corresponding function values

y = zeros(length(x),1);

for i = 1:length(x)
    y(i) = sin(x(i,1));
end
