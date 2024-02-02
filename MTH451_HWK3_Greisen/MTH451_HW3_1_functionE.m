function y = MTH451_HW3_1_functionE (x)
  [n,m]=size(x); 
  
  % initialize what will become final output
  sum=0;
  
  for i=1:n
    % initialize j loop sum 
    jsum=0;
    
    for j=1:n
      
      jsum=jsum+cos(x(j));
      
    endfor
    
    sum=sum+(n+i*(1-cos(x(i)))-sin(x(i))-jsum)^2;
  endfor
  
  y=sum;
endfunction
