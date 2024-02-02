function Y = GaussNewton (H, y0, h, h_min, h_max,tau0, eta, tol)
  
  MAX_k_ITER=750; 
  MAX_j_ITER=10;
  N_opt=5;  
  n_lambda=length(y0); 
  
  
  tau=tau0;
  y=y0;
  
  for k = 1: MAX_k_ITER
 
    % Corrector
     for j = 1:MAX_j_ITER
       
       % Solution Criteria
       F0=feval(H,y);
       norm_F0=norm(F0); 
       if norm_F0<=tol
         Y(k,:)=y;
         break
       endif
       
       if k>=MAX_k_ITER
         fprintf('Maximum number of iterations reached \n \n')
         return
       endif
       
       % Compute the gradient
       G=forward_difference_jacobian(H,y);
       
       % QR Factorization
       [Q,R]=qr(G');
       [n,m]=size(G);
       
       % Solve for s
       L=R(1:n,1:n)';
       b=-F0;
       s=fsub(L,b);
       
       % Solve for d
       d=Q(:,1:n)*s;
       
       % Update y
       y=y+d; 
     endfor
     
     % End Condition
     if Y(k,n_lambda) >= eta
       break
     endif
     
     % Tangent Computation 
     
     % Solve for v  
     G=forward_difference_jacobian(H,y);
     %v=G'*G*tau;
     w=G*tau;
     [Q2,R2]=qr(G');
     [n2,m2]=size(G);
     
     L2=R2(1:n2,1:n2)';
     b2=w;
     
     s2=fsub(L2,b2);
     v=Q2(:,1:n2)*s2;
     
     % Calculate tau 
     tau = tau-v;
     tau=tau/norm(tau);

     % Step Size Adjustment
     h=h*sqrt(N_opt/(j+1)); 
     h=max(h_min,min(h_max,h));
     
     % Predictor, Updating y for next k value 
     y_hat=y+(h*tau);
     y=y_hat; 
     
   endfor
endfunction
