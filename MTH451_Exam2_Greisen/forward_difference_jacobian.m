function [jacobian] = forward_difference_jacobian (f, x)
  %create a copy of x to be used in later calculation
  x_plus=x;
  %initialize the matrix that will become the jacobian matrix
  n=length(x);
  F=feval(f,x);
  m=length(F);
  jacobian=zeros(m,n);
  
  for i = 1:m
    for j = 1:n
      % solve for h
      h=sqrt(eps)*max(abs(x(j)),1);
      % add h to one component of the input x
      x_plus(j)=x(j)+h;
      % calculate the value of the f(x+h)
      F_plus = feval(f,x_plus);
      % calculate the jacobian with the forward difference method
      jacobian(i,j) = (F_plus(i)-F(i))/h;
      % reset x plus h  so that it does not interfere with the remaining 
      % calculations
      x_plus(j)=x(j);
    endfor
  endfor
endfunction