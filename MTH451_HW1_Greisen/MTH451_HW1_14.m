% Matthew D. Greisen
% MTH451A
% Homework 1, Problem #14

% Purpose : Develop a forward difference formula to compute the Jacobian of F(x)
% Your formula should have a truncation error that is O(h). Use your formula to 
% obtain an estimate of the Jacobian of the equations 

% F(x) = [x1-x2^3+5*x2^2-2*x2-13, x1+x2^3+x2^2-14*x2-29] @ x=[6,5]^T

% Compare your numerical results to the analytical solution. 

% Given: See above 

% Assumptions: 

% Solution: 

% create an inline function f to match the function given 

F = @(x) [ (x(1) - x(2)^3 + 5*x(2)^2 - 2*x(2) - 13);
           (x(1) + x(2)^3 + x(2)^2 - 14*x(2) - 29) ];
           
           
% create x to match given test value 

x = [6;5];

% use function file forward_difference_jacobian.m

numerical_jacobian=forward_difference_jacobian(F,x)

% create an inline function to calculate the analytical jacobian 

derivative_f = @ (x) [(1), (-3*x(2)^2 + 10*x(2)-2);
                      (1), (3*x(2)^2 + 2*x(2) - 14)];
                      
analytical_jacobian=derivative_f(x)

absolute_error=abs(analytical_jacobian-numerical_jacobian)
relative_error=absolute_error./analytical_jacobian