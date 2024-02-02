function [theta] = MTH451_HW7_ThetaA (x)
  
  global alpha lambda F_matt
  
  lambda;
  
  [F,H]=feval(F_matt,x);
  
  theta=F+lambda'*H+(1/(2*alpha))*H'*H;

endfunction
