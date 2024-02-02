function [V, h, g] = Exam2_3_function(theta)
  
  N=length(theta);
  L=1/(N-1);
  x_B=0.7;
  y_B=0.3;
  y_C=-0.15; 
  
  % Equality Constraints 
  x_N=0;
  y_N=0;
  for k=1:N
    x_N=x_N+cos(theta(k));
    y_N=y_N+sin(theta(k));
  endfor
  
  % Function V
  
  V=0;
  for i=1:(N-1)
    y_i=0;
    x_i=0;
    for j=1:i
      y_i=y_i+L*sin(theta(j));
      x_i=x_i+L*cos(theta(j));
    endfor
    V=V+y_i; 
  endfor
  
  h=[x_N-x_B; y_N-y_B];
  
  % Inequality constraints 
  g=y_C-y_i;
  
endfunction