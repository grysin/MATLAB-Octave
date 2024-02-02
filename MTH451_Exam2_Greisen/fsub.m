function [y,err] = fsub(L,b)
err = 0;
[n,m] = size(L);
% TODO: check m == n
% TODO: check size(b) == [n,1]
y = zeros(n,1);
for i=1:n
    y(i) = 0;
    for k=1:i-1
        y(i) = y(i) + L(i,k)*y(k);
    end
    if L(i,i) == 0
        fprintf('L(%d,%d) = 0\n',i,i);
        err = 1;
        return
    end
    y(i) = (b(i)-y(i))/L(i,i);
end
