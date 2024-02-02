function [gradient] = central_difference_gradient(f,x)

% Copy X
x_plus=x;
x_minus=x;

%initialize the matrix that will become the gradient matrix
n=length(x);
gradient=zeros(n,1);

for i = 1:n
  %defining h
  h=eps^(1/3)*max(abs(x(i)),1);
  %x plus h and x minus h for each variable
  x_plus(i) = x(i)+h;
  x_minus(i) = x(i)-h;
  %find the functional value of x plus h and x minus h and then use
  %those values to compute the gradient
  gradient(i)=(f(x_plus)-f(x_minus))/(2*h);
  % reset x plus h and x minus h values so that it does not interfere
  % with getting the partial derivatives of the other componenets x2,x3
  % etc. 
  x_plus(i) = x(i);
  x_minus(i) = x(i);
end