function y = fsub(L,b)
[n,m] = size(L);
% TODO: check m == n
% TODO: check size(b) == [n,1]
% TODO: check diag(L) ~= 0
y = zeros(m,1);
for i=1:m
    y(i) = 0;
    for k=1:i-1
        y(i) = y(i) + L(i,k)*y(k);
    end
    y(i) = (b(i)-y(i))/L(i,i);
end
