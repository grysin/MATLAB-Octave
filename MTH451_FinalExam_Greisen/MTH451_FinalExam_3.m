% Matthew D. Greisen
% MTH 451, Spring 2021
% Final Exam Problem 3

% FILES RELATING TO THIS PROBLEM: 

      % FourthOrderROW.m
          % fd_Jacobian.m
      % MTH451_FinalExam_3_Function1.m
      % MTH451_FinalExam_3_Function2.m
      % MTH451_FinalExam_3_Function3.m
       
% SOLUTION: 

% Initial Conditions/General Parameters
y_i=[2;4];
t_i=0;
t1_f=50;
t2_f=500;
t3_f=5000;
h_i=0.0001;
tol=10^-6;

% For t_f = 50 , u = 10 

fprintf('For u = 10 and t_f = 50 \n')
tic
[Y1,T1]=FourthOrderROW('MTH451_FinalExam_3_Function1',y_i,t_i,t1_f,h_i,tol);
toc
N1=length(T1);
fprintf('%4g iterations were required \n',N1)
fprintf('The values of Y(1) and Y(2) at the final time were \n Y(1) = %4g \n Y(2) = %4g \n \n',Y1(N1,:))

Y1_2=Y1(:,2);Y1_1=Y1(:,1);


figure
subplot(2,2,1)
plot(T1,Y1_1)
title('t_f = 50, T vs. Y(1)')
xlabel('T')
ylabel('Y(1)')

subplot(2,2,2)
plot(T1,Y1_2)
title('T vs. Y(2)')
xlabel('T')
ylabel('Y(2)')
      
 subplot(2,2,3)
plot(Y1_1,Y1_2)
title('Y(1) vs. Y(2)')
xlabel('Y(1)')
ylabel('Y(2)')

% For t_f = 500 , u = 100 

fprintf('For u = 100 and t_f = 500 \n')
tic
[Y2,T2]=FourthOrderROW('MTH451_FinalExam_3_Function2',y_i,t_i,t2_f,h_i,tol);
toc
N2=length(T2);
fprintf('%4g iterations were required \n',N2)
fprintf('The values of Y(1) and Y(2) at the final time were \n Y(1) = %4g \n Y(2) = %4g \n \n',Y2(N2,:))

Y2_1=Y2(:,1);
Y2_2=Y2(:,2);

figure
subplot(2,2,1)
plot(T2,Y2_1)
title('t_f = 500, T vs. Y(1)')
xlabel('T')
ylabel('Y(1)')

subplot(2,2,2)
plot(T2,Y2_2)
title('T vs. Y(2)')
xlabel('T')
ylabel('Y(2)')
      
 subplot(2,2,3)
plot(Y2_1,Y2_2)
title('Y(1) vs. Y(2)')
xlabel('Y(1)')
ylabel('Y(2)')

% For t_f = 5000 , u = 1000 

fprintf('For u = 1000 and t_f = 5000 \n')
tic
[Y3,T3]=FourthOrderROW('MTH451_FinalExam_3_Function3',y_i,t_i,t3_f,h_i,tol);
toc
N3=length(T3);
fprintf('%4g iterations were required \n',N3)
fprintf('The values of Y(1) and Y(2) at the final time were \n Y(1) = %4g \n Y(2) = %4g \n \n',Y3(N3,:))

Y3_1=Y3(:,1);
Y3_2=Y3(:,2);

figure
subplot(2,2,1)
plot(T3,Y3_1)
title('t_f = 5000, T vs. Y(1)')
xlabel('T')
ylabel('Y(1)')

subplot(2,2,2)
plot(T3,Y3_2)
title('T vs. Y(2)')
xlabel('T')
ylabel('Y(2)')
      
 subplot(2,2,3)
plot(Y3_1,Y3_2)
title('Y(1) vs. Y(2)')
xlabel('Y(1)')
ylabel('Y(2)')  