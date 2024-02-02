% Matthew D. Greisen
% MTH451A
% Homework 10

 % FILES THAT RELATE TO THIS HOMEWORK: 
        % RK43.m
        % MTH451_HW9_Problem1FunctionA.m
        % MTH451_HW9_Problem1FunctionB.m
        % MTH451_HW9_Problem2Function.m
        % MTH451_HW10_p1e2_analytical.m
        
 % Solution:
 
% Problem 1, Equation A
 
tic
 
tol=10^-6;
 
y0_1=0;
t0_1=0;
tf_1=1;
h_1=0.001;

[Y1,T1] = RK43('MTH451_HW9_Problem1FunctionA', y0_1, t0_1, tf_1, h_1, tol);

figure
subplot(3,1,1)
plot(T1,Y1)
title('Problem 1: Equation 1, Runge Kutta Method Solution')
xlabel('Time')
ylabel('Y value')

p1e1_analytical=@(t) -10*exp(-t/10)+10;
[P1E1_A_T,P1E1_A_Y]=fplot(p1e1_analytical,[0,1]);
subplot(3,1,2)
plot(P1E1_A_T,P1E1_A_Y)
title('Problem 1: Equation 1, Analytical Solution')
xlabel('Time')
ylabel('Y value')

A_analytical=p1e1_analytical(T1);
A_Error=abs(Y1-A_analytical);
subplot(3,1,3)
plot(T1,A_Error)
title('Problem 1: Equation 1, Error in Runge Kutta Solution')
xlabel('Time')
ylabel('Y value')

% Problem 1, Equation B

y0_2=[1;0];
t0_2=0;
tf_2=1;
h_2=0.001;
 
[Y2,T2] = RK43('MTH451_HW9_Problem1FunctionB', y0_2, t0_2, tf_2, h_2, tol);

Y2_1=Y2(:,1);
Y2_2=Y2(:,2);

figure
subplot(3,2,1)
plot(T2,Y2_1)
title('Problem 1: Equation 2, Runge Kutta Method Solution')
xlabel('Time')
ylabel('Y(1) value')

subplot(3,2,2)
plot(T2,Y2_2)
xlabel('Time')
ylabel('Y(2) value')

B_analytical=zeros(length(T2),2);
for i=1:length(T2)
  B_analytical(i,:)=MTH451_HW10_p1e2_analytical(T2(i));
endfor

B_Error=abs(Y2-B_analytical); 

B_analytical_1=B_analytical(:,1);
B_analytical_2=B_analytical(:,2);

B_Error_1=B_Error(:,1);
B_Error_2=B_Error(:,2);

subplot(3,2,3)
plot(T2,B_analytical_1)
title('Problem 1: Equation B, Analytical Solution')
xlabel('Time')
ylabel('Y(1) value')

subplot(3,2,4)
plot(T2,B_analytical_2)
xlabel('Time')
ylabel('Y(2) value')

subplot(3,2,5)
plot(T2,B_Error_1)
title('Problem 1: Equation B, Error of RUnge Kutta Method')
xlabel('Time')
ylabel('Y(1) value')
 
subplot(3,2,6)
plot(T2,B_Error_2)
xlabel('Time')
ylabel('Y(2) value')

% Problem 2

y0_3=[2;4];
t0_3=0;
tf_3=20;
h_3=0.00001;

[Y3,T3] = RK43('MTH451_HW9_Problem2Function', y0_3, t0_3, tf_3, h_3, tol);

Y3_1=Y3(:,1)
Y3_2=Y3(:,2)

figure
subplot(3,1,1);
plot(T3,Y3_1);
title('Problem 2: Y1 vs. T')

subplot(3,1,2);
plot(T3,Y3_2);
title('Y2 vs. T')

subplot(3,1,3);
plot(Y3_1,Y3_2);
xlabel('Y1')
ylabel('Y2')

toc
