% Matthew D. Greisen
% MTH451A
% Homework 1, Problem #10

% Purpose: 

% B) Develop an algorithm that computes the gradient of a function
% using the central difference formula where h is computed according to
% Equation 1.9

% C) Give an operation count for you algorithm. That is, determine how
% many fuction evaluations, multiplications, divisions, additions and
% subtractions are required. Comprare your operation count with that of
% Algorithm 1.3.1

% D) Write a program that implements the central difference formula to
% compute the gradient of a scalar function. Use the program to compute
% the gradient of the function 

% f(x1,x2) = 0.5-x2-(x2+.5)*exp(25*x1/(x1+2)) 

% at the point x1=0.05, x2=0. Also compute the absolute and relative
% errors for the componenets of the gradient vector 

% Given:
% Assumption: 

% Solution: 

% A) See attached derivation MTH451_HW1_10Derivation.pdf

% B) See central_difference_gradient.m

% C) The operation count for my algorithm, cental_difference_gradient.m
% is: 

% 2n evaluations of f(x), 
% 2n mulitplications, 
% n divisions, 
% n additionas 
% and 2n subtractions.    

% Whereas algorithm 1.3.1 requires 

% n+1 evaluations of f(x), 
% n mulitplications, 
% n divisions, 
% n additionas 
% and 2n subtractions.    


% D) 

% Using the central difference gradient function to compute the given problem
f=@(x) 0.5-x(2)-(x(2)+.5)*exp(25*x(1)/(x(1)+2));
x=[0.05,0];
numerical_derivate=central_difference_gradient(f,x)

% finding the analytical gradient of the given problem 
analytical_derivative=zeros(2,1);
partial_derivative_x1 =@(x) (-50*(x(2)+0.5)*exp((25*x(1))/(x(1)+2)))/(x(1)+2)^2;
partial_derivative_x2 =@(x) -exp((25*x(1))/(x(1)+2))-1;
analytical_derivative(1) = partial_derivative_x1(x);
analytical_derivative(2) = partial_derivative_x2(x);
analytical_derivative

absolute_error=abs(analytical_derivative-numerical_derivate)
relative_error=absolute_error./analytical_derivative


 
 

