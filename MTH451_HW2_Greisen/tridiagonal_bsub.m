function x = tridiagonal_bsub (U,y)
  [m,n]=size(U);
  x=zeros(n,1);
  
  x(n)=y(n)/U(2,n);
  
  for i=n-1:-1:2
    x(i)=(y(i)-U(1,i+1)*x(i+1))/U(2,i);
  endfor
  
  x(1)=(y(1)-U(1,2)*x(2))/U(1,1);
  
endfunction
