function [Y,T] = FourthOrderRungeKuttaMethod (F,N,h,t_i,y_i)
  
  T=zeros(1,N);
  [n,m]=size(y_i);
  
  Y=zeros(n,N);
  
  % Step 1
  t0=t_i;
  y0=y_i;
  
  T(1)=t0;
  Y(:,1)=y0;

  % Step 2
  for k = 2:N
    
    % Calculate all values 
    
    k1=feval(F,y0,t0);
    
    y2=y0+(1/2)*h*k1;
    
    t2=t0+(1/2)*h;
    
    k2=feval(F,y2,t2);
    
    y3=y0+(1/2)*h*k2; 
    
    t3=t0+(1/2)*h; 
    
    k3=feval(F,y3,t3); 
    
    y4=y0+h*k3; 
    
    t4=t0+h; 
    
    k4=feval(F,y4,t4); 
    
    % 
    
    y_kplus1=y0+h*((1/6)*k1+(1/3)*k2+(1/3)*k3+(1/6)*k4);
    t_kplus1=t4;
    
    Y(:,k)=y_kplus1;
    T(k)=t_kplus1;
    
    % Update y0 and t0
    
    y0=y_kplus1;
    t0=t_kplus1;
    
  endfor

endfunction
