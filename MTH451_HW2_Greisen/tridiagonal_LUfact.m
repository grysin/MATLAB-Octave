function [L,U] = Tridiagonal_LUfact (A)

% find size of A 
[m,n]=size(A);
% should have m = 3 

% create L and U matrices
L=zeros(2,n); 
U=zeros(2,n);

% initial conditions, first columns
U(:,1)=[A(1,1),0];
L(:,1)=[1;A(2,1)/U(1,1)];

for i=2:n-1
  L(1,i)=1;
  U(1,i)=A(1,i);
  U(2,i)=A(2,i)-L(2,i-1)*U(1,i);
  L(2,i)=A(3,i)/U(2,i);
endfor 
L(:,n)=[1;0];
U(1,n)=A(2,n);
U(2,n)=A(3,n)-L(2,n-1)*U(1,n);

endfunction