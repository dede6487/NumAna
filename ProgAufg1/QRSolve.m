% gibt eine least squares Lösung des GLS Bx=b zurück
% hat A nicht vollen Rang wird 0 zurückgegeben

function [ x ] = QRSolve (B,D, p , k , b )

[~,n] = size(B);

if k < n
    x = zeros(n:1);
else

    Q = CompQ(B,p,k);
    Qt = transpose(Q);
    c= Qt * b;

    R=B (:,p) ;
    x= zeros (n,1) ;

    pi(p) = 1:length(p);

    x(k) = c(k)/D(k);
    for i=k -1: -1:1
        x(i) =(c(i)-dot(R(i,i+1:k) , x(i+1:k))) / D(i);
    end
    x = x(pi);

end
end