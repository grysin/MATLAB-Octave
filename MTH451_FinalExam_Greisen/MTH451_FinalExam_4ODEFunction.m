function Q = MTH451_FinalExam_4ODEFunction (q, t, z)
  
  L1=0.4;
  L2=0.3;
  c=0.3;
  rho=10^3;
  
  p=length(z)/2;
  
  u1_sum=0;
  for k=1:p
    u1_sum=u1_sum+z(k)*t^(k-1);
  endfor
  U1=u1_sum;
  
  u2_sum=0;
  for k=1:p
    u2_sum=u2_sum+z(k+p)*t^(k-1);
  endfor
  U2=u2_sum;
  
  y2=L1*sin(q(1))+L2*sin(q(3));
  s=max(y2-0.5,0);
  
  Q=[q(2);
     -c*q(2)^2+U1;
     q(4);
     -c*q(4)^2+U2;
     0.5*(U1^2+U2^2)+rho*s^2];

endfunction
