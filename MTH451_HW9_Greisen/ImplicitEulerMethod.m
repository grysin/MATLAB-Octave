function [Y,T] = ImplicitEulerMethod (F,N,h,t_i,y_i)
  
  T=zeros(1,N);
  [n,m]=size(y_i);
  
  Y=zeros(n,N);
  
  T(1)=t_i;
  Y(:,1)=y_i;
  
  % Step 1 : Define Psi 
  % See EulerPsi.m
    
  % Step 2
  t0=t_i;
  y0=y_i;
    
    
  % Step 3
  for k = 2:N
    
    % Step 4
    t1=t0+h;
    
    % Step 5 
    y1=EulerNewton(F,y0,t1,h);
    
    Y(:,k)=y1;
    T(k)=t1;
    
    y0=y1;
    t0=t1;
    
  endfor
endfunction
