% Matthew D. Greisen
% MTH451A
% Homework 4, Problem #1

% For part (a) see DampedNewtonZeros.m

% Part (b)
tol=10^-6; 

% DEFINING FUNCTION (a)
         
fa=@(x) [x(1)^2+x(2)^2-2; exp(x(1)-1)+x(2)^3-2];

x0_a_i=[2;3];
[X_a_i,iter_a_i]=DampedNewtonZeros(fa,x0_a_i,tol);

x0_a_ii=[-1;1];
[X_a_ii,iter_a_ii]=DampedNewtonZeros(fa,x0_a_ii,tol);

x0_a_iii=[0;0];
[X_a_iii,iter_a_iii]=DampedNewtonZeros(fa,x0_a_iii,tol);


% DEFINING FUNCTION (b)

fb=@(x) [2*(x(1)+x(2))^2+(x(1)-x(2))^3-8; 5*x(1)^2+(x(2)-3)^2-9];

x0_b_i=[2;2];
[X_b_i,iter_b_i]=DampedNewtonZeros(fb,x0_b_i,tol);

x0_b_ii=[-2;-2];
[X_b_ii,iter_b_ii]=DampedNewtonZeros(fb,x0_b_ii,tol);

% DEFINING FUNCTION (c)

fc=@(x) [exp(x(1)^2+x(2)^2)-3; x(1)+x(2)-sin(3*(x(1)+x(2)))];
x0_c=[0;1];
[X_c,iter_c]=DampedNewtonZeros(fc,x0_c,tol);

% DEFINING FUNCTION (d)

fd=@(x) [x(1)+3*log(abs(x(1)))-x(2)^2; 2*x(1)^2-x(1)*x(2)-5*x(1)+1];
x0_d=[2;2];
[X_d,iter_d]=DampedNewtonZeros(fd,x0_d,tol);

fprintf("\n Minimum of Equation A, using guess 1, is %g iteration \n X = ",iter_a_i)
disp(X_a_i')

fprintf("\n Minimum of Equation A, using guess 2, is %g iteration \n X = ",iter_a_ii)
disp(X_a_ii')

fprintf("\n Minimum of Equation A, using guess 3, is %g iteration \n X = ",iter_a_iii)
disp(X_a_iii')

fprintf("\n Minimum of Equation B, using guess 1, is %g iteration \n X = ",iter_b_i)
disp(X_b_i')

fprintf("\n Minimum of Equation B, using guess 2, is %g iteration \n X = ",iter_b_ii)
disp(X_b_ii')

fprintf("\n Minimum of Equation C, using the given guess value, is %g iteration \n X = ",iter_c)
disp(X_c')

fprintf("\n Minimum of Equation D, using the given guess value, is %g iteration \n X = ",iter_d)
disp(X_d')
