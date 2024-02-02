function y1 = EulerNewton (F,y0,t1,h)
  
  % Parameters
  MAX_ITER=500;
  tol=10^-5;
  
  % initial guess for y1
  y1=y0;
  
  % define psi function
  psi=@(F,y1,y0,t1,h) y1-y0-h*(feval(F,y1,t1));
  
  for j=1:MAX_ITER
    
    % Calculate psi
    psi0=psi(F,y1,y0,t1,h);
    Dpsi=cd_grad(psi,F,y1,y0,t1,h);
    
    % solution condition 
    if norm(psi0)<=tol
      return
    endif
    
    % calculate del y 
    del_y=Dpsi\(-psi0);
    
    % update y1 
    y1=y1+del_y;
    
  endfor

endfunction
