function x = exam1_backward_substitution (U,y)
[n,n] = size(U);
[n,m] = size(y);
x = zeros(n,m);
for i=n:-1:1
  for j=1:m
    sum = 0;
    for k=i+1:n
      sum = sum + U(i,k)*x(k,j);
    endfor
    x(i,j) = (y(i,j)-sum)/U(i,i);
  endfor
endfor

endfunction
