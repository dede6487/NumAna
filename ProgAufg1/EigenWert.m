function [lambda, x, exitflag] = EigenWert(A, mu, max_iter)

if nargin < 3
    max_iter = 500;

exit_flag = 1;

[m,n] = size(A);

if m ~= n
    disp("")


end