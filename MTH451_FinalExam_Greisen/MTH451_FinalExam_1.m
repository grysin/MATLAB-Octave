% Matthew D. Greisen
% MTH 451, Spring 2021
% Final Exam Problem 1

% FILES RELATING TO THIS PROBLEM: 

      % MTH451_FinalExam_1_fourbar.m 
      % MTH451_FinalExam_P.m
      % MTH451_FinalExam_1_InitialConditions.jpeg
      % cont_newton.m

% SOLUTION: 

% Initial conditions

theta2_init_deg=16.72;
theta3_init_deg=229.11;

theta2_init_rad=theta2_init_deg*pi/180;
theta3_init_rad=theta3_init_deg*pi/180;

x0=[theta2_init_rad; theta3_init_rad];

% General Parameters

lambda_deg = [-40:10:40];
lambda_rad=lambda_deg*pi/180;
tol=10^-6;

% Continuation Solver
[X,err]=cont_newton('MTH451_FinalExam_1_FourBar',x0,lambda_rad,tol);

theta1_rad=lambda_rad';
theta2_rad=X(:,1);
theta3_rad=X(:,2);

% Solve for P
N=length(lambda_rad);
P_rad=zeros(N,2);
for i=1:N
  P_rad(i,:)=MTH451_FinalExam1_P(lambda_rad(i),theta2_rad(i));
endfor

X_p=P_rad(:,1)
Y_p=P_rad(:,2)

% Plots 
figure 
subplot(2,2,1)
plot(X_p,Y_p)
title('Point P, X vs. Y')
xlabel('X')
ylabel('Y')

subplot(2,2,2)
plot(theta1_rad,theta2_rad)
title('Theta 1 vs. Theta 2 (rad)')
xlabel('')
ylabel('')

subplot(2,2,3)
plot(theta1_rad,theta3_rad)
title('Theta 1 vs. Theta 3 (rad)')

