function [x,k] = DampedNewtonZeros (f, x0,tol)  
  % find the size of the initial guess
  [n,m]=size(x0);
  % define parameters
  max_iter=7500;
  max_ls=50;
  sigma=0.001;
  beta=0.5;
  for k=1:max_iter
    if k >= max_iter
      fprintf("Maximum number of iterations reached")
      break
    endif
    % CHECKING THE CURRENT X VALUE
    f0=feval(f,x0); % solve for f
    norm_f0=norm(f0); % norm of f0
    %fprintf("iter: %4d F(x)= %10.4e\n", k, norm_f0) % print statement
    if norm_f0 <= tol % solution condidtion
      %fprintf("solved in %4d iterations\n",k)
      x=x0;
      break
    endif
    % SOLVE FOR d 
    j0=fd_Jacobian(f,x0); % solve for jacobian
    d=LUsolve(j0,-f0);
    % DEFINING phi(x)
    phi_x0=(1/2)*f0'*f0; 
    % LINE SEARCH / UPDATING x0 VALUE
    for j=1:max_ls 
      x_bar=x0+(beta^j)*d;
      fbar=feval(f,x_bar);
      phi_xbar=(1/2)*fbar'*fbar;
      if (phi_xbar < (1-(sigma*beta^j))*phi_x0)
        x0=x_bar;
        break
      endif
      if (j >= max_ls)
        %fprintf("Maximum number of line searches reached\n")
        x(:)=sqrt(-1);
        return
      endif
    endfor % line search end 
  endfor % iteration end 
endfunction
