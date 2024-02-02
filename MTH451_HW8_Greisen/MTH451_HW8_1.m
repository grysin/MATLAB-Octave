% Matthew D. Greisen
% MTH451A
% Homework 8

 % FILES THAT RELATE TO THIS HOMEWORK: 
        % ExplicitEulerMethod,m
        % ImplicitEulerMethod.m
              % EulerNewton.m
                    % cd_grad.m
        % MTH451_HW8_Function1.m
        % MTH451_HW8_Function2.m
        % MTH451_HW8_Function1Solutions.pdf
        % MTH451_HW8_Function2Solutions.pdf

clear
tic

% Analytical Solution to Equation 1

eq1_analytical_y1 = @(t) (997/999)*exp(-t)+(2/999)*exp(-1000*t);
eq1_analytical_y2 = @(t) -2*exp(-1000*t);

[T11a,Y11a]=fplot(eq1_analytical_y1,[0,5]);
[T12a,Y12a]=fplot(eq1_analytical_y2,[0,5]);

figure 
subplot(1,3,1)
plot(T11a,Y11a,T12a,Y12a);
title('Eq 1 Analytical Solution')
xlabel('Time')
ylabel('Y')
legend('Y(1)','Y(2)')

% Explicit Solution to Equation 1 

t0=0;
tf=5;

N1=50;
N2=500;
N3=5000;

h1=(tf-t0)/N1;
h2=(tf-t0)/N2;
h3=(tf-t0)/N3;

t_i=0;
y_i=[1;-2];


%[Y1_1,T1_1]=ExplicitEulerMethod('MTH451_HW8_Function1',N1,h1,t_i,y_i);

%[Y1_2,T1_2]=ExplicitEulerMethod('MTH451_HW8_Function1',N2,h2,t_i,y_i);

[Y1_3,T1_3]=ExplicitEulerMethod('MTH451_HW8_Function1',N3,h3,t_i,y_i);

% Implicit Solution to Equation 1
[Y1_3i,T1_3i]=ImplicitEulerMethod('MTH451_HW8_Function1',N3,h3,t_i,y_i);

% Plots/Errors for solutions of Equation 1
hold on
subplot(1,3,2)
plot(T1_3,Y1_3)
title('Eq 1 Explicit Euler, h=0.001')
xlabel('Time')
ylabel('Y')
legend('Y(1)','Y(2)')

hold on 
subplot(1,3,3)
plot(T1_3i,Y1_3i)
title('Eq 1 Implicit Euler, h=0.001')
xlabel('Time')
ylabel('Y')
legend('Y(1)','Y(2)')

% Analytical Solution to Equation 2

eq2_analytical = @(t) 50*(-50*exp(-50*t)+sin(t)+50*cos(t))/2501;
[T2_1a,Y2_1a]=fplot(eq2_analytical,[0,1.5]);
figure
subplot(3,2,1)
plot(T2_1a,Y2_1a)
title('Eq 2, Analytical Solution')
xlabel('Time')
ylabel('Y')

% Explicit Solution to Equation 2 

t_i2=0;
tf=1.5;

h2_1=1.974/50;
h2_2=1.875/50;

N1=39;
N2=41;

y_i2=0;

[Y2_1,T2_1]=ExplicitEulerMethod('MTH451_HW8_Function2',N1,h2_1,t_i2,y_i2);

[Y2_2,T2_2]=ExplicitEulerMethod('MTH451_HW8_Function2',N2,h2_2,t_i2,y_i2);

% Implicit Solution to Equation 2 

[Y2_1i,T2_1i]=ImplicitEulerMethod('MTH451_HW8_Function2',N1,h2_1,t_i2,y_i2);

[Y2_2i,T2_2i]=ImplicitEulerMethod('MTH451_HW8_Function2',N2,h2_2,t_i2,y_i2);

% Plots/Errors for solutions of Equation 2 

hold on
subplot(3,2,3)
plot(T2_1,Y2_1)
title('Eq 2, Explicit Euler, h=1.974/50')
xlabel('Time')
ylabel('Y')

hold on
subplot(3,2,4)
plot(T2_2,Y2_2)
title('Eq 2, Explicit Euler, h=1.875/50')
xlabel('Time')
ylabel('Y')

hold on
subplot(3,2,5)
plot(T2_1i,Y2_1i)
title('Eq 2, Implicit Euler, h=1.974/50')
xlabel('Time')
ylabel('Y')

hold on 
subplot(3,2,6)
plot(T2_2i,Y2_2i)
title('Eq 2, Implicit Euler, h=1.875/50')
xlabel('Time')
ylabel('Y')

toc