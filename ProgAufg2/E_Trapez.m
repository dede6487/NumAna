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

  m = 2;
  F = 0;

  % F_00
  h_0 = (b - a) / N0
  f_a = fun(a)
  T_00 = f_a / 2

  for z = a+h_0:h_0:b-h_0
    T_00 = F_00 + fun(z)/2
  end

  T_00 = (F_00 + fun(b) / 2) * h_0
