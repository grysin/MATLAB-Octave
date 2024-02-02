function [Y,T] = RK43_4(f, y0, t0, tf, h, tol, z)
    
    MAX_STEPS=1000;
    
    % Step 1
    h_min=10^-9;
    beta=0.9;
    fac0=0.2;
    fac1=5;
    p=4;
    
    % Step 2 
    tau = t0;
    y = y0;
    n=length(y);
    t = t0;
    Y = [y'];
    T = [t];
    k1 = feval(f, y, tau, z);
    
    for k = 1:MAX_STEPS
        
        y2 = y + 0.5*h*k1;
        tau2 = t + 0.5*h;
        k2 = feval(f, y2, tau2,z);  
        y3 = y + 0.5*h*k2;
        tau3 = t + 0.5*h;
        k3 = feval(f, y3, tau3,z);  
        y4 = y + h*k3;
        tau4 = t + h;
        k4 = feval(f, y4, tau4,z);
        
        h_6 = h/6.0;
        
        y_1 = y + h_6*(k1 + 2*k2 + 2*k3 + k4);
        t_1 = t + h;
        
        k5=feval(f,y_1,t_1,z);
        
        nu=h_6*(k4-k5);
        
        %calculation of sigma
        sum=0;
        for i=1:n
          abs_nu=abs(nu(i));
          denominator=tol+tol*abs(y(i));
          sum=sum+(abs_nu/denominator)^2;
        endfor
        sigma=sqrt((1/n)*sum);
        
        % h hat 
        h_hat=h*min(fac1,max(fac0,beta*sigma^(-1/p)));
        
        if sigma <=1
          Y = [Y;y_1'];
          T = [T;t_1];
          y=y_1;
          t=t_1;
          if t==tf
            return
          endif
          k1=k5;
          if t+h_hat>tf
            h_hat=tf-t;
          endif
        endif
        
        h=h_hat;
        if h<h_min
          fprintf('Error in RK43.m : Stepsize too small \n')
          return
        endif
      endfor
      fprintf('Error in RK43.m : Too many steps \n')
      
endfunction