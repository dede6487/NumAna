function [I, exitflag] = E_Trapez(fun, a,b, m_max, N0, e)

    if nargin < 6
        e = 1.e-10;
        if nargin < 5
            N0 = ceil((b-a)/0.1);
            if nargin < 4
                m_max = 6
            end
        end
    end
    
    exitflag = 0;
    s = abs(b-a);

    T = zeros(N0, 1);

    for m = 0 : m_max
        
    end

end