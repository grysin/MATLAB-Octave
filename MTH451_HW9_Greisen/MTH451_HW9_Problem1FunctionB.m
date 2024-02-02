function X = MTH451_HW9_Problem1FunctionB (x,t)
  
  E=0.1;
  w=2*pi;
  
  X=[x(2);
     -2*E*w*x(2)-w^w*x(1)];

endfunction
