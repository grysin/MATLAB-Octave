
function Y = MTH451_HW9_Problem2Function (y,t)
  
  u=1;
  
  Y=[y(2);
     u*(1-y(1)^2)*y(2)-y(1)];
  
endfunction
