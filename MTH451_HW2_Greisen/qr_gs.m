function [Q,R] = qr_gs(A)
[n,m] = size(A);
% TODO: check that n >= m
Q = zeros(n,m); % select size to match the Algorithm in the slides
R = zeros(m,m); % select size to match the Algorithm in the slides
for j = 1:m
  for i=1:(j-1)
    R(i,j) = Q(:,i)'*A(:,j);
  endfor
  s = zeros(n,1);
  for i = 1:(j-1)
    s = s + R(i,j)*Q(:,i);
  endfor
  uj = A(:,j) - s;
  R(j,j) = norm(uj);
  Q(:,j) = uj/R(j,j);
endfor

endfunction
  
  