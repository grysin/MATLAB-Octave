function x = bfgs_inverse_hessian (f, x0, tol)
  
  % define I (aka G-0)
  [n,m]=size(x0);
  G_k=eye(n);
  
  % parameters
  max_iter=7500; 
  max_ls=100;
  beta=0.25;
  sigma=0.001;
  
  for k=1:max_iter
    
    % CHECKING THE CURRENT VALUE OF X
    
    % compute function value of x0
    f0=feval(f,x0);
    
    % compute gradient value of x0
    g0=fd_grad(f,x0); 
    norm_g0=norm(g0);
    
    % compute d
    d=-G_k*g0;
    
    % print iter #, function value, norm of gradient
    %fprintf("iter: %4d f: %10.4e |df|: %10.4e\n", k, f0, norm_g0);
    
    % if the norm of the gradient is less than the tolerance, break loop
    if norm_g0 <= tol
      x=x0; 
      fprintf("Minimum reached in %4d iterations \n",k)
      break
    endif
    
    % UPDATING THE VALUE OF X  
    
    % Armijo rule line search 
    
    for j =1:max_ls
      alpha=beta^j;
      x1=x0+alpha*d; 
      f1=feval(f,x1); 
      if f1-f0 <= sigma*alpha*g0'*d; 
        alpha_star=alpha;
        x1=x0+alpha_star*d; 
        break
      endif
    endfor
    
    # UPDATING THE VALUE OF G
    
    s=x1-x0; 
    g1=fd_grad(f,x1); 
    y=g1-g0;
    
    if s'*y > 0
      
      first_term=1+(y'*G_k*y)/(s'*y);
      second_term=(s*s')/(s'*y); 
      third_term=(s*y'*G_k+G_k*y*s')/(s'*y); 

      G_k1=G_k+first_term*second_term-third_term;
    
    else
      
      G_k1=G_k;
  
  endif
  
  x0=x1;
  G_k=G_k1;
  
endfor


endfunction
