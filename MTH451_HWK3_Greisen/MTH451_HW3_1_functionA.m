function y = MTH451_HW3_1_functionA (x)
  [n,m]=size(x);
  %initialize what will become summation term
  sum=0;
  
  for i=1:n-1
    % sum is equal to its previous value + current value
    sum = sum+100*(x(i+1)-x(i)^2)^2+(1-x(i))^2;
  endfor
  
  % output is equal to final sum value
  y=sum;
endfunction

