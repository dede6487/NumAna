% nimmt eine Matrix A und gibt eine QR Faktorisierung gemäß Algo 2.3 
% aus dem Algorithmische Methoden in der Numerik Skript zurück
% p ... Permutationsvektor zur Permutationsmatrix P
% so dass QR = AP
% Diagonale von R wird auf D zurückgegeben
% k ist Rang der Matrix

function [A, D, pi , k ] = QRFact (A)
    
[m,n] = size(A);

pi = 1:n; %p=pi
si = zeros(n,1);
D = zeros(min(m,n),1);
nq = n;

for j = n:-1:1 
    si(j) = dot(A(:,j),A(:,j));
    if si(j) == 0
        temp1 = pi(j); %alternative (maybe less efficient) [pi(j),pi(nq)] = deal(pi(nb),pi(j));
        pi(j) = pi(nq);
        pi(nq) = temp1;
        nq = nq-1;
    end
end
siq = si;

for i = 1:nq%different loop iterator than in script, here i is k

    [val,piv] = max(si(pi(i:nq))./siq(pi(i:nq)));
    
    piv = piv+i-1;

    if val <= -1 %piv < k wenn val <= -1
        k =i-1;
        return;
    end

    temp1 = pi(i);
    pi(i) = pi(piv);
    pi(piv) = temp1;

    si(pi(i)) = dot(A(i:m,pi(i)),A(i:m,pi(i)));

    if si(pi(i)) < m * eps^2 * siq(pi(i))
        k = i-1;
        return;
    end
    
    if sign(A(i,(pi(i)))) == 0 %to compensate for the different sign function
        D(i,1) = -sqrt(si(pi(i)));
    else
        D(i,1) = -sign(A(i,(pi(i)))) * sqrt(si(pi(i)));
    end

    A(i,pi(i)) = A(i, pi(i)) - D(i,1);

    for j = i+1:nq
        gamma = dot(A(i:m,pi(j)),A(i:m,pi(i))) / (-D(i,1)*A(i,pi(i))); %dot() is scalarproduct
        A(i:m, pi(j)) = A(i:m, pi(j)) - gamma * A(i:m, pi(i));
        si(pi(j)) = si(pi(j)) - A(i, pi(j))^2;
        if si(pi(j)) < m * eps * siq(pi(j))
            si(pi(j)) = dot(A(i+1:m,pi(j)),A(i+1:m,pi(j)));
        end
    end
end
k = nq;
%return;
end