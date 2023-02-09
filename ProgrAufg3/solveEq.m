function [x, exitflag, iter, f_eval] = solveEq(fun, x0)
    x = x0;
    maxIter = 10000;
    [F,DF] = fun(x);
    f_eval = 1;
    mu = 0.5; % Wert aus Skript
    exitflag = 1;
    iter = 0;
    
    % falls bereits nahe genug an 0
    if(norm(F) <= 10e-16) % verfahren erfolgreich, weil nahe genug an 0
        exitflag = 0;
        return;
    end
    
    for iter = 1 : maxIter      
       p = linsolve(DF,-F);
      
       a = 1;
       [F_x_k,DF_x_k] = fun(x + a  * p);
       f_eval = f_eval + 1;
       
       while( norm(F_x_k) > (1- mu  * a) * norm(F))

          if(a >= 0.25)
             a = a/ 2; 
          elseif(a > 1/3)
              a = 1/3;
          elseif(a > 0.1)
              a = 0.1;
          else
              a = a / 10;
          end
          
          [F_x_k,DF_x_k] = fun(x + a  * p); % berechnet F(xk + ak*pk)
          f_eval = f_eval + 1;
          
       end
       
       F = F_x_k;
       DF = DF_x_k;
       x = x + a * p;

       if(norm(F) <= 10e-16) % verfahren erfolgreich, weil nahe genug an 0
           exitflag = 0;
           return;
       end
       
    end
 end