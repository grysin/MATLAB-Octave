% Matthew D. Greisen
% MTH 451, Spring 2021
% Final Exam Problem 2

% FILES RELATING TO THIS PROBLEM: 
      % RK43.m
      % MTH451_FinalExam_2_Function1.m
      % MTH451_FinalExam_2_Function2.m
      % MTH451_FinalExam_2_MatrixMath.pdf


% SOLUTION: 

% General Parameters
q0=[0;0;0;0.1];
t0=0;
tf=3;
h=0.001;
tol=10^-6;

% Case 1: No force
[Y1,T1] = RK43('MTH451_FinalExam_2_Function1', q0, t0, tf, h, tol);

X1=Y1(:,1);
X_dot1=Y1(:,2);
Theta1=Y1(:,3);
Theta_dot1=Y1(:,4);

N=length(T1);
endposition1=X1(N);
endvelocity1=X_dot1(N);
endangle1=Theta1(N);
endangvelocity1=Theta_dot1(N);

fprintf('When no force is applied \n the ending position, velocity, angular position and angular velocity are \n Position: %4g \n Velocity: %4g \n Angle: %4g \n Angular Velocity: %4g \n', endposition1,endvelocity1,endangle1,endangvelocity1 )
fprintf('\n')


% Plotting
figure
subplot(2,2,1)
plot(T1,X1)
title('No Force Applied, Position vs. Time')
xlabel('Time (sec)')
ylabel('Position')


subplot(2,2,2)
plot(T1,X_dot1)
title('Velocity vs. Time')
xlabel('Time (sec)')
ylabel('Velocity')

subplot(2,2,3)
plot(T1,Theta1)
title('Anglular Position vs. Time')
xlabel('Time (sec)')
ylabel('Angular Position')

subplot(2,2,4)
plot(T1,Theta_dot1)
title('Angular Velocity vs. Time')
xlabel('Time (sec)')
ylabel('Angular Velocity')

% Case 2: Force applied 
[Y2,T2] = RK43('MTH451_FinalExam_2_Function2', q0, t0, tf, h, tol);

X2=Y2(:,1);
X_dot2=Y2(:,2);
Theta2=Y2(:,3);
Theta_dot2=Y2(:,4);

N2=length(T2);
endposition2=X2(N2);
endvelocity2=X_dot2(N2);
endangle2=Theta2(2);
endangvelocity2=Theta_dot2(N2);

fprintf('When force is applied \n the ending position, velocity, angular position and angular velocity are \n Position: %4g \n Velocity: %4g \n Angle: %4g \n Angular Velocity: %4g \n', endposition2,endvelocity2,endangle2,endangvelocity2 )

% Plotting
figure
subplot(2,2,1)
plot(T2,X2)
title('Force Applied, Position vs. Time')
xlabel('Time (sec)')
ylabel('Position')

subplot(2,2,2)
plot(T2,X_dot2)
title('Velocity vs. Time')
xlabel('Time (sec)')
ylabel('Velocity')

subplot(2,2,3)
plot(T2,Theta2)
title('Anglular Position vs. Time')
xlabel('Time (sec)')
ylabel('Angular Position')

subplot(2,2,4)
plot(T2,Theta_dot2)
title('Angular Velocity vs. Time')
xlabel('Time (sec)')
ylabel('Angular Velocity')