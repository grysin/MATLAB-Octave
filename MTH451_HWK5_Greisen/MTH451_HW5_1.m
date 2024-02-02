% Matthew D. Greisen
% MTH451A
% Homework 5, Problem #1

% Part A 

% See Cont_Newton_MG.m , Cont_Damped_Newton_Solver.m , Cont_Newton_FD_Jacobian.m 

% PART B 

% parameters 
tol=10^-6;
a1=1.5;
a2=5.0;
a3=3.0;
lambda=linspace(0,2*pi,101); 

x0=[6.14;4]; 

% Define H
function H = HWK5_slider_crank(x,lambda)
  
  a1=1.5;
  a2=5.0;
  a3=3.0;
  theta1=lambda;
  theta2=x(1);
  theta3=x(2);

  H = [a1*cos(theta1)+a2*cos(theta2)+a3*cos(theta3)-4.5;
       a1*sin(theta1)+a2*sin(theta2)+a3*sin(theta3)+3.0];
end

theta1=lambda';

X = Cont_Newton_MG('HWK5_slider_crank', x0, lambda, tol);
theta2=X(:,1);
theta3=X(:,2);

x_p=a1*cos(theta1)+10.5*cos(theta2)+0.5*cos(theta2-pi/2);
y_p=a1*sin(theta1)+10.5*sin(theta2)+0.5*sin(theta2-pi/2);

figure; 
plot(theta1,theta2)
hold on
plot(theta1,theta3)
xlabel('Theta 1 (Radians)')
ylabel('Radians')
legend('Theta 2','Theta3')
title('Theta 1 vs. Theta 2/3')

figure
plot(x_p, y_p) 
title('X vs. Y')
