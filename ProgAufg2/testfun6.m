function [y] = testfun6 (x)
%takes a vector of x and gives a vector y with the corresponding function values

y = zeros(length(x),1);

for i = 1:length(x)
    y(i,1) = x.^2;
end

  
