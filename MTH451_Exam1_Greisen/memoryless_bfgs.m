function x= memoryless_bfgs (f,x0,tol)
  
  %f
  %x0
  %tol
  
  % parameters
  max_iter=7500; 
  max_ls=100;
  beta=0.25;
  sigma=0.001;
  
  for k=1:max_iter
    % optimization achieved criteria 
    f0=feval(f,x0,0);
    g0=feval(f,x0,1); 
    d0=-1*g0;
    norm_g=norm(g0);
    fprintf("iter: %4d f: %10.4e |df|: %10.4e\n", k, f0, norm_g);
    
    if norm_g<=tol
      break
    endif
    
    % Armijo line search
    for j=1:max_ls
      alpha=beta^j;
      x1=x0+alpha*d0;
      f1=feval(f,x1,0);
      delta_f=f1-f0;
      if delta_f<=sigma*alpha*g0'*d0;
        break
      endif
      if j>=max_ls
        fprintf("Error: Too many line search iterations\n"); return
      endif
    endfor
    
    alpha_star=alpha;
    
    x1=x0+alpha_star*d0;
    d1=-1*feval(f,x1,1);
    s=x1-x0;
    f1=feval(f,x1,0);
    y=f1-f0;
 
    if s'*y > 0
      
      one_plus_y_term=(1+(y'*y)/(s'*y));
      
      first_term=(one_plus_y_term*(s*s'*d1)./(s'*y));
      
      second_term=(s*y'*d1+y*s'*d1)./(s'*y);
      
      d1=d1+first_term-second_term;

    endif
    
    x0=x1;
    
    if k>=max_iter
      fprintf("Error: Maximum number of iterations reached")
    endif
  endfor
endfunction