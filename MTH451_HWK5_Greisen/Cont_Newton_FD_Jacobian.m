function J = Cont_Newton_FD_Jacobian (H,x0,lambda)
  
    F0=feval(H,x0,lambda);
    
    n = length(x0);
    
    x = x0;
    
    J = zeros(n,n);
    
    fac = sqrt(eps);
    
    for i = 1:n
      
        h = fac*max(1,abs(x0(i)));
        
        x(i) = x0(i) + h;
        
        F = feval(H, x, lambda);
        
        J(:,i) = (F-F0)/h;
        
        x(i) = x0(i);
        
    endfor
    
endfunction


