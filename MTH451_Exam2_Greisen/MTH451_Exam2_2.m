% Matthew D. Greisen
% MTH 451, Spring 2021
% Exam 2 Problem 2

% FILES RELATING TO THIS PROBLEM: 

  % Exam2_lifting_rig.m
  % GaussNewton.m
  % forward_difference_jacobian.m
  % fsub.m

% SOLUTION: 

% Define H

   % See Exam2_lifting_rig.m
   
% Paramters 
h=10^-3; 
h_min=10^-6;
h_max=10^3; 
N_opt=5;
tol=10^-6;
eta=1;

% Initial Values
y0=[0;0;0];
f0=feval('Exam2_lifting_rig',y0);
tau0=[0;0;1];

% Gauss Newton Continuation Method
X=GaussNewton('Exam2_lifting_rig', y0, h, h_min, h_max,tau0, eta, tol);

theta=X(:,1);
alpha=X(:,2);
v=X(:,3);

% Plots

figure
plot(v,theta)
xlabel('Continuation Parameter V')
ylabel('Theta')
title('Continuation Paramter vs. Theta')


figure
plot(v,alpha)
xlabel('Continuation Parameter V')
ylabel('Alpha')
title('Continuation Paramter vs. Alpha')

