function J = MTH451_FinalExam_4CostFunction (z)
  
  p=length(z)/2;
  L1=0.4;
  L2=0.3;
  c=0.3;
  rho=10^3;
  
  q0=[0;0;0;0;0];
  t0=0;
  tf=1;
  h=0.0001;
  tol=10^-6;
  
  % needs to get passed z, 
  [Q,T]=RK43_4('MTH451_FinalExam_4ODEFunction',q0,t0,tf,h,tol,z);
  
  N=length(T);
 
  q1_1=Q(N,1);
  q2_1=Q(N,2);
  q3_1=Q(N,3);
  q4_1=Q(N,4);
  q5_1=Q(N,5);
  
  x2_1=L1*cos(q1_1)+L2*cos(q3_1);
  y2_1=L1*sin(q1_1)+L2*sin(q3_1);
  
  J=q5_1+rho*(x2_1^2+(y2_1-0.5)^2+q2_1^2+q4_1^2);
  
endfunction