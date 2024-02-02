function F = MTH451_HW6_function2 (y)
  
  u=-0.008;
  
  x1=y(1);
  x2=y(2);
  x3=y(3);
  x4=y(4);
  x5=y(5);
  lambda=y(6);
  
  
  F= [ -3.933*x1+0.107*x2+0.126*x3-9.99*x5-45.83*lambda-0.727*x2*x3+8.39*x3*x4-684.4*x4*x5+63.5*x4*lambda; 
       -0.987*x2-22.95*x4-28.37*u+0.949*x1*x3+0.173*x1*x5;
       0.002*x1-0.235*x3+5.67*x5-0.921*lambda-0.713*x1*x2-1.578*x1*x4+1.132*x4*lambda; 
       x2-x4-0.168*u-x1*x5; 
       -x3-0.196*x5-0.0071*lambda+x1*x4 ]; 
  

endfunction

