% Matthew D. Greisen
% MTH 451, Spring 2021
% Exam 1 Problem 4

% FILES RELATING TO THIS PROBLEM: 
  % MTH451_Exam1Problem4_Greisen.pdf
  % V_theta.m
  % V_theta_i.m
  % V_theta_test.m 
  % memoryless_bfgs.m 
  
N11=11; 
theta11=zeros(1,N11);
tol_11=(10^-3);
%x=fmin_sd('V_theta_i',theta11,tol_11)
%x=memoryless_bfgs('V_theta_i',theta11,tol_11);
x=memoryless_bfgs('V_theta',theta11,tol_11);