function [f,h,fgrad,hgrad] = MTH451_HW7_functionB(x)
  
  x1=x(1);
  x2=x(2);
  x3=x(3);
  x4=x(4);
  x5=x(5);
  
  f = exp(x1*x2*x3*x4*x5);
  
  fgrad = [x2*x3*x4*x5*exp(x1*x2*x3*x4*x5);
          x1*x3*x4*x5*exp(x1*x2*x3*x4*x5);
          x1*x2*x4*x5*exp(x1*x2*x3*x4*x5);
          x1*x2*x3*x5*exp(x1*x2*x3*x4*x5);
          x1*x2*x3*x4*exp(x1*x2*x3*x4*x5)];
  
  h=[2*x1+x2^2+x3^2+x4^2+x5^2-10;
     x2*x3-5*x4*x5;
     x1^3+x2^3+1];
     
  hgrad=[2,2*x2,2*x3,2*x4,2*x5;
         0,x3,x2,5*x5,5*x4;
         3*x1^2,3*x2^3,0,0,0];

endfunction
