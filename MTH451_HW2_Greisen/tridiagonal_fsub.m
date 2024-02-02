function y = tridiagonal_fsub (L,b)
[n,m] = size(L);
y=zeros(m,1);

y(1)=b(1);
for i=2:m
  y(i)=b(i)-L(2,i-1)*y(i-1);
endfor
endfunction
