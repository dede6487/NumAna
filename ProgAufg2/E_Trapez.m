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

H = zeros(m_max+1,1);

%calculating h
H(1) = (b - a) / N0;   %is h_0
H(2) = H(1)/2; %is h_1
H(3) = H(2)/3; %is h_2
   
T = zeros(m_max+1, m_max+1);

%initializing T(0,0), T(1,0), T(2,0), here T(1,1), T(2,1), ...
x = zeros(N0 * 6+1,1);

%T(0,0), T(1,1)
for i = 1:N0+1
        x(i) = a + (i-1) * H(1);
end

f_values = fun(x);
F = max(abs(f_values));


T(1,1) = f_values(1)/2;
T(1,1) = T(1,1) + f_values(N0)/2;
for j = 2:N0
    T(1,1) = T(1,1) + f_values(j);
end
T(1,1) = T(1,1)*H(1);

%T(1,0), T(2,1)
for i = 1:N0*2+1
        x(i) = a + (i-1) * H(2);
end

f_values = fun(x);
if max(abs(f_values)) > F
    F = max(abs(f_values));
end

T(2,1) = f_values(1)/2;
T(2,1) = T(2,1) + f_values(N0)/2;
for j = 2:N0*2
    T(2,1) = T(2,1) + f_values(j);
end
T(2,1) = T(2,1)*H(2);

%T(2,0), T(3,1)
for i = 1:N0*6+1
        x(i) = a + (i-1) * H(3);
end

f_values = fun(x);
if max(abs(f_values)) > F
    F = max(abs(f_values));
end

T(3,1) = f_values(1)/2;
T(3,1) = T(3,1) + f_values(N0)/2;
for j = 2:N0*6
    T(3,1) = T(3,1) + f_values(j);
end
T(3,1) = T(3,1)*H(3);

for m = 2:m_max
    if m > 2
        H(m+1) = H(m)/2;
        
        %startvector
    
        l = 6*N0*(2)^(m-2);
    
        %calculating T(m+1,1)
    
        x = zeros(l+1,1);
    
        for i = 1:l+1
            x(i) = a + (i-1) * H(m+1);
        end
        
        f_values = fun(x);
        if max(abs(f_values)) > F
            F = max(abs(f_values));
        end
        
        T(m+1,1) = f_values(1)/2;
        T(m+1,1) = T(m+1,1) + f_values(N0)/2;
        for j = 2:l
            T(m+1,1) = T(m+1,1) + f_values(j);
        end
        T(m+1,1) = T(m+1,1) * H(m+1);
    end

    %first calculate the full tableau
    %this results in T being a lower left triangle matrix
    
    %starting from 2 because column 1 is Ti0
    for k = max(2,m-4):m+1
        for i = k:m+1
            T(i,k) = T(i,k-1) + (T(i,k-1)-T(i-1,k-1))/((H(i-k+1)/H(i))*(H(i-k+1)/H(i))-1);
        end
    end

    %then check for termination criteria

    s = abs(b-a)*F;

    for k = 2:m
        for i = k:m
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
