% we assume, that A is invertible, which means that it has full rank
function [x] = QR_solve(A,b)

    [k,~] = size(A);
    [Q,R] = qr(A);

    c = Q'*b;

    x(k) = c(k)/D(k);
    for i=k -1: -1:1
        x(i) =(c(i)-dot(R(i,i+1:k) , x(i+1:k))) / D(i);
    end

end

