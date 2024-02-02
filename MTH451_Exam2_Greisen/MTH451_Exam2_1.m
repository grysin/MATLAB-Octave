% Matthew D. Greisen
% MTH 451, Spring 2021
% Exam 2 Problem 1

% FILES RELATING TO THIS PROBLEM: 

    % Cont_Newton_MG.m
    % Cont_Damped_Newton_Solver.m
    % Cont_Newton_FD_Jacobian.m
    % Exam2_slider_crank.m
    % MTH451_Exam2_1_Theta23_Greisen.pdf
    % MTH451_Exam2_1_R24_Greisen.pdf
    

% SOLUTION: 

% Define H

    % See Exam2_slider_crank.m

% Initial Conditions

r2_init=sqrt(20); 
theta2_init=atan(2); 
theta3_init=asin((1/3)*(8-8*sin(theta2_init)));
r4_init=8*cos(theta2_init)+3*cos(theta3_init);

x0=[theta2_init; theta3_init; r2_init; r4_init];

% General Parameters

lambda = linspace(0,2*pi,101);
tol=10^-6;

% Simple Continuation Method 

    % See Cont_Newton_MG.m , Cont_Damped_Newton_Solver.m , Cont_Newton_FD_Jacobian.m

X=Cont_Newton_MG('Exam2_slider_crank',x0,lambda,tol);

theta1=lambda';
theta2=X(:,1); 
theta3=X(:,2);
r2=X(:,3); 
r4=X(:,4); 

% Values at 0, pi/2 , pi , 3pi/2 

fprintf('\n @ Theta1 = 0 \n \n R2 = %3g \n R4 = %3g \n Theta 2 = %3g \n Theta 3 = %3g \n \n', r2(1), r4(1), theta2(1), theta3(1));
fprintf('\n @ Theta1 = pi/2 \n \n R2 = %3g \n R4 = %3g \n Theta 2 = %3g \n Theta 3 = %3g \n \n', r2(26), r4(26), theta2(26), theta3(26));
fprintf('\n @ Theta1 = pi \n \n R2 = %3g \n R4 = %3g \n Theta 2 = %3g \n Theta 3 = %3g \n \n', r2(51), r4(51), theta2(51), theta3(51));
fprintf('\n @ Theta1 = 3pi/2 \n \n R2 = %3g \n R4 = %3g \n Theta 2 = %3g \n Theta 3 = %3g \n \n', r2(76), r4(76), theta2(76), theta3(76));


% Plots
figure; 
plot(theta1,theta2)
hold on
plot(theta1,theta3)
xlabel('Theta 1 (Radians)')
ylabel('Radians')
legend('Theta 2','Theta 3')
title('Theta 1 vs. Theta 2/3')

figure 
plot(theta1, r2)
hold on 
plot(theta1, r4)
xlabel('Theta 1 (Radians)')
ylabel('Length')
legend('R2','R4')
title('R2 & R4 vs Theta 1')