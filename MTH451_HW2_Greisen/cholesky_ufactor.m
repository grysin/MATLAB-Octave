
function U = cholesky_ufactor(A)
format long

[n,m] = size(A);
U = zeros(n,n);

for i=1:n % for i equal 1 to size of the matrix 
  %create sum to subtract from A(i,i) to find U(i,i)
  sum=0; % initialize sum 
  for x=1:i-1 %from 1 to 1 less than i
    sum=sum+U(x,i)^2; % sum is equal to itself plus U(every row before i, current i) squared
  endfor 
  U(i,i)=sqrt(A(i,i)-sum); % U(i,i) = sqaure root of A(i,i) - sum 
  % With U(i,i) solve for the rest of the values in the row 
  % solve U(i,[i+1:n])
  for j=i+1:n
    % create new sum to substract from A(i,i) to find U(i,j)
    sum2 =0; % initialize sum 
    for k=1:i-1
      sum2=sum2+U(k,i)*U(k,j);
    endfor
    U(i,j)=(A(i,j)-sum2)/U(i,i);
  endfor
endfor

endfunction

