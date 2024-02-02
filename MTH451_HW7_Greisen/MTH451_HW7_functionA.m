function [f,h,fgrad,hgrad] = MTH451_HW7_functionA (x)
  
  x1=x(1);
  x2=x(2);
  
  a=3;
  b=-3;
  c=3;
  
  f=(0.5)*((x1-a)^2+(x2-b)^2);
  
  fgrad=[x1-a;x2-b];
  
  h=x1+x2-c;
  
  hgrad=[1,1];
  
  
endfunction
