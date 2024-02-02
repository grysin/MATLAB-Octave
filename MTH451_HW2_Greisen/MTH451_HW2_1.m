% Matthew D. Greisen
% MTH451A
% Homework 2, Problem #1
clear all
close all
clc
%create n vector
for N=1:15
  %create the H matrix
  H=zeros(N,N); 
  for i=1:N
    for j=1:N
      H(i,j)=1/(i+j-1);
    endfor
  endfor
  H;
  
  %create the x bar matrix 
  x_bar=zeros(N,1);
  for i=1:N
    x_bar(i)=1+i-(N+1)/2;
  endfor
  %create the vector b
  b = (H*x_bar)
  %solve for X
  x=LUsolve(H,b)
  %absolute and relative errors
  ae(N)=norm((x_bar-x),'INF');
  re(N)=ae(N)/max(1,norm(x_bar,'INF'));
endfor

figure
plot(ae)
hold on
plot(re)
title('Homework 2 Problem 1')

% Commenting on the results: The error is relatively small until a large 
% relative peak at n =14 before dropping back down again slightly at n = 15