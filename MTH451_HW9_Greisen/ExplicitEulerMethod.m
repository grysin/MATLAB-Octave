function [Y,T] = ExplicitEulerMethod(F,N,h,t_i,y_i)
  
  T=zeros(1,N);
  [n,m]=size(y_i);
  
  Y=zeros(n,N);
  
  % Step 1
  t0=t_i;
  y0=y_i;
  
  T(1)=t_i;
  Y(:,1)=y_i;

  % Step 2
  for k = 2:N
    
    %fprintf('time   Y value     \n ')
    %fprintf('t=%2g  y=%3d \n',t0, y0)
    
   % Step 3
   df0=feval(F,y0,t0);
   y1=y0+h*df0;
   
   % Step 4
   t1=t0+h;
   
   Y(:,k)=y1;
   T(k)=t1;
   
   % Step 5
   y0=y1;
   t0=t1;
   
 endfor
 
endfunction