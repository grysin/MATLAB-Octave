function [L,U,err] = LUfac(A)
err = 0;
[n,m] = size(A);
% TODO: check m == n
L = eye(n);
U = zeros(n,n);
for j=1:n
    for i=1:j
        s = 0;
        for k=1:i-1
            s = s + L(i,k)*U(k,j);
        end
        U(i,j) = A(i,j) - s;
    end
    if U(j,j) == 0 % if abs(U(j,j)) < TINY
        fprintf('A is singular\n');
        err = 1;
        return
    end
    for i=j+1:n
        s = 0;
        for k = 1:j-1
            s = s + L(i,k)*U(k,j);
        end
        L(i,j) = (A(i,j) - s)/U(j,j);
    end
    L(j,j) = 1;
end
