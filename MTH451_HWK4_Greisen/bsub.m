function x = bsub(U,y)
[n,m] = size(U);
% TODO: check m == n
% TODO: check size(y) == [n,1]
% TODO: check diag(U) ~= 0
x = zeros(n,1);
for i=n:-1:1
    x(i) = 0;
    for k=i+1:n
        x(i) = x(i) + U(i,k)*x(k);
    end
    x(i) = (y(i)-x(i))/U(i,i);
end
