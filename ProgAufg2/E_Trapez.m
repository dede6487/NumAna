function [I, exitflag] = E_Trapez(fun, a, b, m_max, N0, e)
  if nargin < 3
    exitflag = 2
    disp("E_Trapez:\nnot enough input values\nprovide at least 3")
    return;
  end

  if nargin < 6
    e = 1.e-10
    if nargin < 5
      N0 = ceil((b-a)/0.1)
      if nargin < 4
        m_max = 6
      end
    end
  end

  F = 0;

  % F_00
  f_a = fun(a)
  f_b = fun(b)
  %T_00 = f_a / 2

  H = zeros(m_max,1);s

  %calculating h
  H(1) = (b - a) / N0;   %is h_0
  H(2) = H(1)/2; %is h_1
  H(3) = H(2)/3; %is h_2
  
  %for every time m gets increased, add H(m+1)
  %(+1) because vectors start with 1 and not 0

  %startvector
  T_i = zeros(N0, 1);

  %initializing the first two elements of this vector
  T_i(1) = %?
  T_1(2) = %?
 
  %for m = 2 we only need the first two values of T_00, thus we only
  %calculate the next values of T_00 when m grows

  %initializing, not completely done, unsure how
  for z = a+h_0:h_0:b-h_0
    T_i(z) = F_00 + fun(z)/2
  end
    
  %finisihing T_00, unsure how to do this
  for i = 1:N0 %i from 1 to length of T_i
      T_i = (F_00 + fun(b) / 2) * H(1) %h_0  
  end
  
  I = zeros(N0, 1); %this vector should hold the results, we cant use T_i
  %for this because we still need the values in there for increased m

  for m = 2:m_max
    H(m+1) = H(m)/2;
    
    %copying the start values (i.e. T_00)
    for i = 1:m
        I(i) = T_i(i);
    end
    
    %now calculate the full tableau

    
    
  end

  

end
