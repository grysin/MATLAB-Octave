function x= fmin_BFGS_MG (f,x0,tol,f_grad)
  
  %f
  %x0
  %tol
  
  % parameters
  max_iter=750;
  max_ls=100;
  beta=0.25;
  sigma=0.001;
  N=length(x0);
  H=eye(N);
  
  for k=1:max_iter
    % optimization achieved criteria 
    f0=feval(f,x0);
    g0=cd_grad(f,x0);
    d0=-LUsolve(H,g0);
    norm_g=norm(g0);
    %fprintf("iter: %4d f: %10.4e |df|: %10.4e\n", k, f0, norm_g);
    
    if norm_g<=tol
      x=x0;
      break
    endif
    
    % Armijo line search
    for j=1:max_ls
      alpha=beta^j;
      x1=x0+alpha*d0;
      f1=feval(f,x1);
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
    g1=cd_grad(f,x1);
    f1=feval(f,x1);
    
    H=BFGSupdate(H,x0,x1,g0,g1);
    x0=x1;
    
    if k>=max_iter
      fprintf("Error: Maximum number of iterations reached \n")
    endif
  endfor
endfunction
