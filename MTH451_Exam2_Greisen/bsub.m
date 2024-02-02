function [x,err] = bsub(U,y)
err = 0;
[n,m] = size(U);
% TODO: check m == n
% TODO: check size(y) == [n,1]
x = zeros(n,1);
for i=n:-1:1
    x(i) = 0;
    for k=i+1:n
        x(i) = x(i) + U(i,k)*x(k);
    end
    if U(i,i) == 0
        fprintf('U(%d,%d) = 0\n',i,i);
        err = 1;
        return
    end
    x(i) = (y(i)-x(i))/U(i,i);
end
