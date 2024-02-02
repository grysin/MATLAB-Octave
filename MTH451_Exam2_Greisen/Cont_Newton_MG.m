function X = Cont_Newton_MG (H, x0, Lambda, tol)
  
  n_x=length(x0); % the length of the initial guess, the unknown parameters to be solved for

  n_lambda=length(Lambda); % the length of the known parameter

  x_init=x0; % making a copy of the initial guess 

  X=zeros(n_lambda,n_x); % final solution has n_lambda rows and n_x columns

  for k =1:n_lambda % cycling through the length of the known parameter
    
    lambda=Lambda(k);
    
    x = Cont_Damped_Newton_Solver(H, x_init, lambda, tol); % solving for x for each lambda
    
    x_init = x; % reset x_init
    
    X(k,:) = x'; % store the solution for each element of lambda
  endfor
  
endfunction


  