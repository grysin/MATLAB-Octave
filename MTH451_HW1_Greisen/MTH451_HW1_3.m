% Matthew D. Greisen
% MTH451A
% Homework 1, Problem #3

% Purpose: 

% A) Using normalized floating point number representation list all
% real numbers that can be represented exactly 

% B) Determine the unit roundoff

% C) Given x=3.14159 and y=0.5, what is the result of the expression
% z=x*y when preformed on the previous specified system? What are the 
% absolute and relative errors? 

% Given: 

% Base=2, Precision=3, e_min= -1, e_max = 3

% Assumptions: 

% Solution: 

%Part A
clear
clc

Base=2;
Precision=3;
e_min=-1;
e_max=3;

count=0;

for sign = 0:1:1
  for d1 = 0:1:1
    for d2 = 0:1:1
      for e = e_min:1:e_max
        X=(-1)^(sign)*(1+(d1/Base)+(d2/Base^2))*(Base^e);
        count=count+1;
        numbers(count)=X;
      endfor
    endfor
  endfor
endfor


disp('All of the real numbers that can be represented exactly are')
disp(numbers)

% Part B
fprintf("\n")
unit_roundoff=(1/2)*Base^(1-Precision)
fprintf("\n")
% Part C

x=3.14159;
y=0.5;

z1=x*y;
z2=x*y*(1+unit_roundoff)
fprintf("\n")
%z3=x*y*(1+(2*unit_roundoff)+unit_roundoff^2);

absolute_error=abs(z1-z2)
fprintf("\n")
relative_error=absolute_error/z1