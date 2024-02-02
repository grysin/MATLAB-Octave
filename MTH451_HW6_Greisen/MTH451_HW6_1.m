% Matthew D. Greisen
% MTH451A
% Homework 6, Problem #1

% FILES THAT RELATE TO THIS ASSIGNMENT: 
        % GaussNewton.m 
        % MTH451_HW6_function.m 
        % MTH451_HW6_function2.m
        % forward_difference_jacobian.m 
        % fsub.m

        
% Solution: 

    % Part A: See GaussNewton.m 
    
    
    % Part B: 
        
% Part B (1) 

h=10^-3; 
h_min=10^-6;
h_max=10^-1; 
N_opt=5;
tol=10^-6;
eta=1;

y0=[0;0;0;0;0;0];
H=feval('MTH451_HW6_function',y0)

% how to solve for tau? 
tau0=[0;0;0;0;0;1]

Y=GaussNewton('MTH451_HW6_function', y0, h, h_min, h_max,tau0, eta, tol)

x1_1=Y(:,1);
x2_1=Y(:,2);
x3_1=Y(:,3);
x4_1=Y(:,4);
x5_1=Y(:,5);
lambda_1=Y(:,6);

% Create Plots
figure
plot (lambda_1,x1_1)
xlabel('Continuation Paramter')
ylabel('Values of X')
title('U = 0 , Values of X1 vs. Continuation Parameter')
figure
plot (lambda_1,x2_1)
xlabel('Continuation Paramter')
ylabel('Values of X')
title('U = 0 , Values of X2 vs. Continuation Parameter')
figure
plot (lambda_1,x3_1)
xlabel('Continuation Paramter')
ylabel('Values of X')
title('U = 0 , Values of X3 vs. Continuation Parameter')
figure
plot (lambda_1,x4_1)
xlabel('Continuation Paramter')
ylabel('Values of X')
title('U = 0 , Values of X4 vs. Continuation Parameter')
figure
plot (lambda_1,x5_1)
xlabel('Continuation Paramter')
ylabel('Values of X')
title('U = 0 , Values of X5 vs. Continuation Parameter')

% Part B (2) 

y0_2=[.0002;0.0082;0;0.0095;0;0];
tau02=[0;0;0;0;0;-1]

Y2=GaussNewton('MTH451_HW6_function2', y0_2, h, h_min, h_max,tau02, eta, tol)

x1_2=Y2(:,1);
x2_2=Y2(:,2);
x3_2=Y2(:,3);
x4_2=Y2(:,4);
x5_2=Y2(:,5);
lambda_2=Y2(:,6);

% Create Plots
figure
plot (lambda_2,x1_2)
xlabel('Continuation Paramter')
ylabel('Values of X')
title('U = -0.008 , Values of X1 vs. Continuation Parameter')
figure
plot (lambda_2,x2_2)
xlabel('Continuation Paramter')
ylabel('Values of X')
title('U = -0.008 , Values of X2 vs. Continuation Parameter')
figure
plot (lambda_2,x3_2)
xlabel('Continuation Paramter')
ylabel('Values of X')
title('U = -0.008 , Values of X3 vs. Continuation Parameter')
figure
plot (lambda_2,x4_2)
xlabel('Continuation Paramter')
ylabel('Values of X')
title('U = -0.008 , Values of X4 vs. Continuation Parameter')
figure
plot (lambda_2,x5_2)
xlabel('Continuation Paramter')
ylabel('Values of X')
title('U = -0.008, Values of X5 vs. Continuation Parameter')


