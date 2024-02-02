function v = V_theta_i (theta, mode)
  N=length(theta);
  p=10^3;
  g=9.8; 
  L=1; 
  u=0.7;
  
  if mode == 0
    v1=0;
    h=0;
    for i=1:N-1; 
      h=h+(L/i)*sin(theta(i));
      v1=v1+(1/i-1)*g*h;
    endfor
    
    sum2=0;
    for i=1:N;
      sum2=sum2+(L/i)*cos(theta(i));
    endfor
    v2=(p/2)*(u*L-sum2)^2;

    sum3=0; 
    for i=1:N; 
      sum3=sum3+(L/i)*sin(theta(i));
    endfor
    v3=(p/2)*sum3^2;
    
    v=v1+v2+v3;
  endif
  
  if mode == 1
    
    sumd1=0;
    for i = 1:N-1; 
      sumd1=sumd1+(L/(i*(i-1))*cos(theta(i)));
    endfor
    dv1=g*sumd1;
    
    cos_sumd2=0;
    sin_sumd2=0;
    for i=1:N;
      cos_sumd2=cos_sumd2+((L/i)*cos(theta(i)));
      sin_sumd2=sin_sumd2+((L/i)*sin(theta(i)));
    endfor
    dv2=p*(u*L-cos_sumd2)*sin_sumd2;
    
    cos_sumd3=0;
    sin_sumd3=0;
    for i=1:N;
      cos_sumd3=cos_sumd3+((L/i)*cos(theta(i)));
      sin_sumd3=sin_sumd3+((L/i)*sin(theta(i)));
    endfor
    dv3=p*sin_sumd3*cos_sumd3;
    
    v=dv1+dv2+dv3; 
  endif
endfunction


