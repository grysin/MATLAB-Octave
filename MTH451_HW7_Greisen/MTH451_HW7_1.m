% Matthew D. Greisen
% MTH451A
% Homework 7, Problem #1

% FILES THAT RELATE TO THIS ASSIGNMENT: 
    
    % AugmentedLagrangian.m
    % MTH451_HW7_ThetaA.m
    % MTH451_HW7_FunctionA.m
    % MTH451_HW7_FunctionB.m
    % fmin_BFGS.m
          % cd_grad.m
          % BFGSUpdate.m
    
% SOLUTION: 

% Part A

i=1:20;
alpha=[0.5.^i];
x0_a=[10;10];
tol=10^-4;
lambda0=[1];
[X_a,Lam_a]=AugmentedLagrangian('MTH451_HW7_functionA',x0_a,lambda0,alpha,tol)


% Part B

i=1:20;
alpha=[0.5.^i];
x0_b=[-1;-1;-1;-1;-1];
tol=10^-4;
lambda0=[1;1;1];
[X_b,Lam_b]=AugmentedLagrangian('MTH451_HW7_functionB',x0_b,lambda0,alpha,tol)