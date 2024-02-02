% Matthew D. Greisen
% MTH451A
% Homework 2, Problem #3
clear
clc

% define A matrix and b vector 
A =[5.76726,0.75166,0.36371,0.68326,0.36536;
   0.75166,5.67889,0.23914,0.63509,0.14912;
   0.36371,0.23914,5.90905,0.36502,0.82444;
   0.68326,0.63509,0.36502,5.51865,0.11787;
   0.36536,0.14912,0.82444,0.11787,5.81971];
b=[1;2;3;4;5];
   
% use cholesky_ufactor to solve for U
U=cholesky_ufactor(A)

% check to make sure it matches A
A;
A_bar=U'*U;
A_dif=abs(A-A_bar)

%solve for y
y=inv(U')*b;

%solve for x
x=inv(U)*y;
x_bar=A\b;
x_dif=abs(x_bar-x)

%check x 
b_bar=A*x;
b;

