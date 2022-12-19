function [I, exitflag] = E_Trapez(fun, a, b, m_max, N0, e)

exitflag = 1;

if nargin < 3
  exitflag = 2;
  disp("E_Trapez:\nnot enough input values\nprovide at least 3")
  return;
end

%
%sanity checks for loop iterators need to be done!!!!!!!!!!!!!
%

if nargin < 6
    e = 1.e-10;
    if nargin < 5
        N0 = ceil((b-a)/0.1);
        if nargin < 4
            m_max = 6;
        end
    end
end

H = zeros(m_max,1);

%calculating h
H(1) = (b - a) / N0;   %is h_0
H(2) = H(1)/2; %is h_1
H(3) = H(2)/3; %is h_2
   
for m = 2:m_max
    %for every time m gets increased, add H(m+1)
    %(+1) because vectors start with 1 and not 0
    H(m+1) = H(m)/2;
 
    %startvector
    %for m = 0 we just have N0 elements in there
    %for m = 1 N0*2 elements
    %for m = 2 N0*2*3 elements, from there on it doubles with every m

    l = 6*N0*(2)^(m-2)+1;

    %initial values for f
    x = zeros(l,1);

    for i = 1:l
        x(i) = i * H(m);
    end

    f_values = fun(x);

    %initial values for Ti0
    T = zeros(l, l);

    for i = 1:l
        T(i,1) = f_values(1)/2;
        T(i,1) = T(i,1) + f_values(l)/2;
        for j = 2:l-1
            T(i,1) = T(i,1) + f_values(j);
        end
    end

    %first calculate the full tableau
    %this results in T being a lower left triangle matrix
    
    %starting from 2 because column 1 is Ti0
    for k = 2:m+1
        for i = k:m+1
           T(i,k) = T(i,k-1) + (T(i,k-1)-T(i-1,k-1))/((H(i-k)/H(i))*(H(i-k)/H(i))-1); 
        end
    end

    %then check for termination criteria

    F = max(f_values);
    s = abs(b-a)*F;

    for k = 2:m+1
        for i = k:m+1
            if abs(T(i+1,k)-T(i,k)) <= e*s
                I = T(i+1,k+1);
                exitflag = 0;
                return
            end
        end
    end

end

I = T(m_max+1,m_max+1);

end