
function [Q,R] = modified_qr_gs (A)
  [n,m] = size(A);
  
  Q=zeros(n,m);
  R=zeros(m,m);
  U=A;
  
  for k = 1:m
    R(k,k)=norm(U(:,k));
    Q(:,k)=U(:,k)/R(k,k);
    for j=k+1:m
      R(k,j)=Q(:,k)'*U(:,j);
      U(:,j)=U(:,j)-Q(:,k)*R(k,j);
    endfor
  endfor
  

endfunction
