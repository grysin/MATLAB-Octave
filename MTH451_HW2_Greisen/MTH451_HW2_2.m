% Matthew D. Greisen
% MTH451A
% Homework 2, Problem #2

%set N
n1=10
n2=100

%Create an A1 matrix, (tridiagonal & without zeros) the size of N
A1=zeros(3,n1);
A1(:,1)=[2;-1;0];
A1(:,n1)=[0;-1;2];
for i=2:n1-1
  A1(:,i)=[-1;2;-1];
endfor
A1;

b1=zeros(n1,1);
b1(1)=1;

[L,U]=tridiagonal_LUfact(A1);
L1=L
U1=U
y1=tridiagonal_fsub(L1,b1);
x1=tridiagonal_bsub(U1,y1)

A2=zeros(3,n2);
A2(:,1)=[2;-1;0];
A2(:,n2)=[0;-1;2];
for i=2:n2-1
  A2(:,i)=[-1;2;-1];
endfor
A2;

b2=zeros(n2,1);
b2(1)=1;

[L,U]=tridiagonal_LUfact(A2);
L2=L;
U2=U;
y2=tridiagonal_fsub(L2,b2);
x2=tridiagonal_bsub(U2,y2)

% How many operations are required to compute the LU factors? 

% it requires:
% n-1 subtractions,
% n-1 multiplications,
% n-1 divisions, 
% to factor the compute the LU factors 

% How many operations are required to obtain the solution to the linear 
% system once L and U are known? 

% it requires:
% 2n-2 subtractions 
% 2n-2 multiplications 
% n divisions 
% to obtain the solution to the linear system after factoring 
