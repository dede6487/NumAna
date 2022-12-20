function [y] = testfun5 (x)
%takes a vector of x and gives a vector y with the corresponding function values

y = zeros(length(x),1);

for i = 1:length(x)
    y(i,1) = 2.^x(i,1);
end

  
