function X = Cont_Damped_Newton_Solver(H, x0, lambda, tol)
    
    MAX_ITER = 100; % set max iteration
    MAX_LS = 50; % set max line search 
    beta=0.5; 
    sigma=10^-4;
  
    for k = 1:MAX_ITER
      
      % CHECKING CURRENT VALUE OF X
      F0 = feval(H, x0, lambda); % functional value
      norm_F0 = norm(F0); % solution condition 
      if norm_F0 <= tol
        X=x0;
        return
      endif
      
      # DAMPED NEWTON ALGORITHM, from page 143 of textbook 
      J0 = Cont_Newton_FD_Jacobian(H, x0, lambda); % find jacobian 
      d = -J0\F0; % solve for d
      phi_x0=(1/2)*F0'*F0; % solve for phi
      gradient_phi_x_d=-F0'*F0; % solve for gradient phi * d 
      
      for j = 1: MAX_LS
        x=x0+(beta^j*d); 
        F1=feval(H,x,lambda);
        phi_x=(1/2)*F1'*F1; 
        if phi_x <= (phi_x0+(sigma*beta^j*gradient_phi_x_d))
          x0=x;
          break
        endif
        if j>=MAX_LS
          fprintf("Max number of line search iterations reached \n")
        endif
      endfor
      
      if k >= MAX_ITER
        fprintf("Max number of iterations reached \n")
        return
      endif
      
    endfor
  endfunction
