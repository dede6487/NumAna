function[lambda, x, exitflag] = EigenWert(A, mu, max_iter)

    if nargin < 3
        max_iter = 500;
    end

    exitflag = 1;

    [m, n] = size(A);
    if m ~= n
        disp('Matrix ist nicht quadratisch.');
        return;
    end

    z = ones(n, 1);
    I = eye(n);
    for k = 1 : max_iter
        v = z/norm(z, 2);
        z = linsolve((A-mu*I), v);
        v = z/norm(z, 2);
    end

    %exitcondition needs to be checked

    lambda = v'*(A*v);

    if norm(A*v - lambda*v) < 1e-10
        exitflag = 0;
    end

    x = v;
end
