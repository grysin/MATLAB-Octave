% Matthew D. Greisen
% MTH451A
% Homework 9

 % FILES THAT RELATE TO THIS HOMEWORK: 
        % ExplicitEulerMethod,m
        % ImplicitEulerMethod.m
              % EulerNewton.m
                    % cd_grad.m
        % FourthOrderRungeKuttaMethod.m
        % MTH451_HW9_Problem1FunctionA.m
        % MTH451_HW9_Problem1FunctionB.m
        % MTH451_HW9_Problem2Function.m
        
        
 % Solution:

h=0.1;
N=10;
x_i=0;
t_i=0;

                                  % Problem 1 

h1=0.1;
N1=10;

h2=0.01;
N2=100;

h3=0.001; 
N3=1000; 

h4=0.0001;
N4=10000;


x_i=0;
t_i=0;

% Equation A, Analytical Solution

p1e1_analytical=@(t) -10*exp(-t/10)+10;
[P1E1_A_T,P1E1_A_Y]=fplot(p1e1_analytical,[0,1]);
figure 
subplot(2,2,1)
plot(P1E1_A_T,P1E1_A_Y)
title('Problem 1, Equation 1 Analytical Solution')

% Equation A, 4th Order Runge Kutta Solution

[YRK1A,TRK1A]=FourthOrderRungeKuttaMethod('MTH451_HW9_Problem1FunctionA',N1,h1,t_i,x_i);
subplot(2,2,2)
plot(TRK1A,YRK1A)
title('4th Order Runge Kutta, h=10^-^1')
xlabel('T')
ylabel('Y')


% Equation A, Explicit Euler Method Solution

[YXU1A,TXU1A]=ExplicitEulerMethod('MTH451_HW9_Problem1FunctionA',N1,h1,t_i,x_i);

subplot(2,2,3)
plot(TXU1A,YXU1A)
title('Explicit Euler Method, h=10^-^1')
xlabel('T')
ylabel('Y')


% Equation A, Implicit Euler Method Solution

[YMU1A,TMU1A]=ImplicitEulerMethod('MTH451_HW9_Problem1FunctionA',N1,h1,t_i,x_i);

subplot(2,2,4)
plot(TMU1A,YMU1A)
title('Implicit Euler Method, h=10^-^1')
xlabel('T')
ylabel('Y')
      

      
x_i=[1;0];
t_i=0;

% Equation B, 4th Order Runge Kutta Solution

[YRK1B,TRK1B]=FourthOrderRungeKuttaMethod('MTH451_HW9_Problem1FunctionB',N4,h4,t_i,x_i);
y1_RKB=YRK1B(1,:);
y2_RKB=YRK1B(2,:);


figure
subplot(3,2,1)
plot(TRK1B,y1_RKB)
title('4^t^h RK Method Solution')
xlabel('T')
ylabel('Y1')

subplot(3,2,2)
plot(TRK1B,y2_RKB)
title('4^t^h RK Method Solution')
xlabel('T')
ylabel('Y2')

% Equation B, Explicit Euler Method Solution

[YXU1B,TXU1B]=ExplicitEulerMethod('MTH451_HW9_Problem1FunctionB',N4,h4,t_i,x_i);

y1_XUB=YXU1B(1,:);
y2_XUB=YXU1B(2,:);

subplot(3,2,3)
plot(TXU1B,y1_XUB)
title('Explicit Euler Method')
xlabel('T')
ylabel('Y1')

subplot(3,2,4)
plot(TXU1B,y2_XUB)
title('Explicit Euler Method')
xlabel('T')
ylabel('Y2')

% Equation B, Implicit Euler Method Solution

[YMU1B,TMU1B]=ImplicitEulerMethod('MTH451_HW9_Problem1FunctionB',N4,h4,t_i,x_i);

y1_MUB=YMU1B(1,:);
y2_MUB=YMU1B(2,:);

subplot(3,2,5)
plot(TMU1B,y1_MUB)
title('Implicit Euler Method')
xlabel('T')
ylabel('Y1')

subplot(3,2,6)
plot(TMU1B,y2_MUB)
title('Explicit Euler Method')
xlabel('T')
ylabel('Y2')
                                  % Problem 2
                                  
y_i=[2;4];
t_i=0;
t_f=20;
Nb=10000;
hb=(t_f-t_i)/N;

%[YRK2,TRK2]=FourthOrderRungeKuttaMethod('MTH451_HW9_Problem2Function',Nb,hb,t_i,y_i);
% Was unable to get this to work 


