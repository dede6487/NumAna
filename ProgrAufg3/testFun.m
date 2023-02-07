function [F, DF] = testFun(x)
% n = 2    
    F= zeros(2,1);
    F(1) = sin(x(1));
    F(2) = cos(x(2));
    DF = zeros(2,2);
    DF(1,1)=cos(x(1));
    DF(1,2)= 0;
    DF(2,2)=-sin(x(2));
    DF(2,1)=0;    

end

