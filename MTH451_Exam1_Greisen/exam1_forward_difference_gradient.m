function gradient = exam1_forward_difference_gradient (f,x)

%initialize fourth root of machine epsilon
cube_root_eps=eps^(1/3); 

%initialize initial f(x)
f_x=feval(f,x); 

% create a copy of x to be used in the calculation of the gradient 
x_plus_h=x;
x_plus_2h=x;

% find length of x
n=length(x);

% initialize what will become the gradient output
gradient=zeros(n,1);

for i=1:n
  
  %define the size of the step to be used in calculation 
  h=cube_root_eps*max(abs(x(i)),1);
  
  % define x + h
  x_plus_h(i)=x(i)+h;
  
  % define x+2h
  x_plus_2h(i)=x(i)+2*h;
 
  % solve for f(x+h)
  f_plus_h=feval(f,x_plus_h);
  
  % solve for f(x+2h)
  f_plus_2h=feval(f,x_plus_2h);
  
  % compute the gradient
  gradient(i)=(-3*f_x+4*f_plus_h-f_plus_2h)/(2*h);
  
  % reset x plus h for next 
  x_plus_h(i)=x(i);
  
  % reset x plus 2h for next
  x_plus_2h(i)=x(i);
end