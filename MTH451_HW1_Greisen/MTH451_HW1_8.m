% Matthew D. Greisen
% MTH451A
% Homework 1, Problem #8

% Purpose: 

%Using h= 10^-1, 10^-2, 10^-3, 10^-4, 10^-5, 10^-6, 10^-7, 10^-8,
% 10^-9, 10^-10, 10^-11, 10^-12

% A) Compute the derivate of f(x)=e^x*sin(x), x=pi/8
% B) Compute the derivate of f(x)=e^x*sin(x), x=pi/4
% C) Compute the derivate of f(x)=e^x*sin(x), x=pi/2
% Construct a table showing the error between the numerical derivateive
% and the exact derivative for each value of h. Plot the log of the
% absolute error and the log of the relative error. Comment on the results.

% Given: listed above

% Assumptions: 

% Solution: 

clear 
clc


% define array h
h= [10^-1, 10^-2, 10^-3, 10^-4, 10^-5, 10^-6, 10^-7, 10^-8, 10^-9, 10^-10, 10^-11, 10^-12];

% inline function for numerical derivative
numerical_derivative=@(x,h) ((exp(x+h)*sin(x+h))-(exp(x)*sin(x)))/h;

%inline function for exact derivative 
exact_derivative=@(x) exp(x)*(cos(x)+sin(x));

%values of x for each of the parts 
a=pi()/8;
b=pi()/4;
c=pi()/2;

%for loop to get numberical and exact derivates for part a
%even though exact derivative wont change, want it as a array so that I can
%use it to solve for the errors as arrays

for i = 1:length(h) 
  numerical_a(i)=numerical_derivative(a,h(i));
  exact_a(i)=exact_derivative(a);
end

%solving for absolute, relative and log of relative errors
AbsoluteError_a=abs(exact_a-numerical_a);
RelativeError_a=AbsoluteError_a./exact_a;


%plotting relative and absolute error against h
figure
loglog(h,AbsoluteError_a,'r',h,RelativeError_a,'b')
%xticks([10^-12, 10^-11, 10^-10, 10^-9, 10^-8, 10^-7, 10^-6, 10^-5, 10^-4, 10^-3, 10^-2, 10^-1])
%yticks([10^-8, 10^-7, 10^-6, 10^-5, 10^-4, 10^-3, 10^-2,10^-1])
legend('Absolute Error','Relative Error')
xlabel('h')
ylabel('Error')
title('Numerical Derivative Error, A')

% Repeat for part B

for i = 1:length(h) 
  numerical_b(i)=numerical_derivative(b,h(i));
  exact_b(i)=exact_derivative(b);
end

%solving for absolute, relative and log of relative errors
AbsoluteError_b=abs(exact_b-numerical_b);
RelativeError_b=AbsoluteError_b./exact_b;

%plotting relative and absolute error against h
figure
loglog(h,AbsoluteError_b,'g',h,RelativeError_b,'m')
xticks([10^-12, 10^-11, 10^-10, 10^-9, 10^-8, 10^-7, 10^-6, 10^-5, 10^-4, 10^-3, 10^-2, 10^-1])
yticks([10^-8, 10^-7, 10^-6, 10^-5, 10^-4, 10^-3, 10^-2,10^-1])
legend('Absolute Error','Relative Error')
xlabel('h')
ylabel('Error')
title('Numerical Derivative Error, B')

% Repeat for part C

for i = 1:length(h) 
  numerical_c(i)=numerical_derivative(c,h(i));
  exact_c(i)=exact_derivative(c);
end

%solving for absolute, relative and log of relative errors
AbsoluteError_c=abs(exact_c-numerical_c);
RelativeError_c=AbsoluteError_c./exact_c;

%plotting relative and absolute error against h
figure
loglog(h,AbsoluteError_c,'c',h,RelativeError_c,'k')
xticks([10^-12, 10^-11, 10^-10, 10^-9, 10^-8, 10^-7, 10^-6, 10^-5, 10^-4, 10^-3, 10^-2, 10^-1])
yticks([10^-11 10^-10 10^-9 10^-8, 10^-7, 10^-6, 10^-5, 10^-4, 10^-3, 10^-2,10^-1])
legend('Absolute Error','Relative Error')
xlabel('h')
ylabel('Error')
title('Numerical Derivative Error, C')


AbsoluteError_a

AbsoluteError_b

AbsoluteError_c

fprintf("Commenting on the results \n")
fprintf("The results of the three graphs are all relatively similar to the graph showed in class which gives me some confidence in the answers, they all peak at slighly different values of h and (assuming that my answer is correct) it is interesting that the same function can have different optimal values of h.")