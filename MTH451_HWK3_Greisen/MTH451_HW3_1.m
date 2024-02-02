% Matthew D. Greisen
% MTH451A
% Homework 3, Problem #1

clear
clc

% part (b) 
tol=10^-5;

% 1st function 

Na=10; 
x0_a=zeros(Na,1); 
for i=1:Na
  if rem(i,2) == 0
    x0_a(i)=1; 
  else
    x0_a(i)=-1.2;
  endif
endfor

x_A = bfgs_inverse_hessian('MTH451_HW3_1_functionA', x0_a, tol)

% 2nd function

Nb=4; 
x0_b=zeros(Nb,1); 
for i=1:Nb
  if rem(i,2) == 0
    x0_b(i)=-1; 
  else
    x0_b(i)=-3;
  endif
endfor

xB=bfgs_inverse_hessian('MTH451_HW3_1_functionB', x0_b, tol)

% 3rd function
x0_c=[3;-1;0;1];

xC=bfgs_inverse_hessian('MTH451_HW3_1_functionC', x0_c, tol)

% 4th function
x0_d=[-1.2;-1];

xD=bfgs_inverse_hessian('MTH451_HW3_1_functionD', x0_d, tol)

% 5th function

Ne=10; 
x0_e=zeros(Ne,1); 
for i=1:Ne
  x0_e(i)=1/(5*Ne); 
endfor

xE=bfgs_inverse_hessian('MTH451_HW3_1_functionE', x0_e, tol)