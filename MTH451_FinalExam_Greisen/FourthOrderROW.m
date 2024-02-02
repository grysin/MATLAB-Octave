function [Y,T] = FourthOrderROW (F,y_i,t_i,t_f,h_i,tol)
  
  h_min=10^-9;
  beta=0.9;
  fac_0=0.2;
  fac_1=5;
  p=4;
  
  t0=t_i;
  y0=y_i;
  Y = [y0'];
  T = [t0];
  h=h_i;
  n=length(y_i);
  
  I=eye(n,n);
  MAX_ITER=3000;
  
  for j=1:MAX_ITER
    
    % Determine jacobian 
    J=fd_Jacobian(F,y0);
    
    % Solve for E
    E=I-(1/2)*h*J;
    
    % E*k1=f(y0); Solve for k1
    f0=feval(F,y0);
    k1=E\f0;
    
    % Solve for y2
    y2=y0+h*k1;
    
    % E*k2=f(y2)-4*k1; Solve for k2
    f2=feval(F,y2);
    k2=E\(f2-4*k1);
    
    % Solve for y3
    y3=y0+(24/25)*h*k1+(3/25)*h*k2;
    
    % E*k3=f(y3)+(186/25)*k1+(6/5)*k2; Solve for k3
    f3=feval(F,y3);
    k3=E\(f3+(186/25)*k1+(6/5)*k2);
    
    % Solve for y4
    y4=y0+(24/25)*h*k1+(3/25)*h*k2;
    
    % E*k4=f(y4)-(56/125)*k1-(27/125)*k2-(1/5)*k3; Solve for k4
    f4=feval(F,y4);
    k4=E\(f4-(56/125)*k1-(27/125)*k2-(1/5)*k3);
    
    % Solve for y
    y=y0+h*((19/18)*k1+(1/4)*k2+(25/216)*k3+(125/216)*k4);
    t=t0+h;
    
    % Solve for nu
    nu=h*((17/108)*k1+(7/72)*k2+(125/216)*k4);
    
    % Solve for sigma
    sum=0;
    for i=1:n
      abs_nu=abs(nu(i));
      denominator=tol+tol*abs(y0(i));
      sum=sum+(abs_nu/denominator)^2;
    endfor
    sigma=sqrt((1/n)*sum);
    
    % Solve h hat
    h_hat=h*min(fac_1,max(fac_0,beta*sigma^(-1/p)));
    
    %
    if sigma <=1
      if t==t_f
        Y = [Y;y'];
        T = [T;t]; 
        return
      endif
      Y = [Y;y'];
      T = [T;t];
      y0=y;
      t0=t;
      if t+h_hat>t_f
        h_hat=t_f-t;
      endif
    endif
    
    h=h_hat;
    
    if h<h_min
      fprintf('Error in FourthOrderROW: Stepsize is too small')
      return
    endif
  endfor

  
fprintf('Error in FourthOrderROW: Too many iterations\n')
return

endfunction
