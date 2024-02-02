function [X,Lam] = AugmentedLagrangian(F,x0,lambda0,Alpha,tol)
  
  
  global alpha lambda F_matt
  
  F_matt=F;
  
  % Step 0: Parameters / Initial values
  N=length(Alpha);
  x=x0;
  lambda=lambda0;
  
  % Step 1: Define Theta / Lagrangian function
      % See MTH451_HW7_ThetaA.m
      % See MTH451_HW7_ThetaB.m
      
      
  
  for k=1:N   % Step 2: For Loop 
    
    alpha=Alpha(k), % Step 3: alpha=Alpha(k)
    
    x1=fmin_BFGS('MTH451_HW7_ThetaA',x,tol); % Step 4: Solve min of theta funciton to get x_k+1
    
    [F1,H1,fgrad,hgrad]=feval(F_matt,x1); 
    
    lambda=lambda+(1/alpha)*H1; % Step 5: Updating lambda
    
    condition1=fgrad+hgrad'*lambda;
    
    if norm(condition1) <= tol && norm(H1) <= tol
      X=x1;
      Lam=lambda;
      return
    endif
    
    x=x1;

endfor

%fprintf('Error: Tolerance condition not met')

X=x1; 
Lam=lambda;

endfunction
