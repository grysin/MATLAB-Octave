function X = MTH451_HW10_p1e2_analytical(t)
  
  x10=1;
  x20=0;
  
  wn=2*pi;
  xi=0.1;
  s = sqrt(1-xi*xi);
  wd = wn*s;
  X = [ x10*exp(-xi*wn*t)*(cos(wd*t) + (xi/s)*sin(wd*t)) + (x20/wd)*exp(-xi*wn*t)*sin(wd*t);
  -xi*wn*x10*exp(-xi*wn*t)*(cos(wd*t) + (xi/s)*sin(wd*t)) + x10*exp(-xi*wn*t)*(-wd*sin(wd*t)) ] ;

endfunction
