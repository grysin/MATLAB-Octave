% Matthew D. Greisen
% MTH 451, Spring 2021
% Exam 2 Problem 3

% FILES RELATING TO THIS PROBLEM: 

    % Exam2_3_function.m
    % sumt3_MG.m
        % phi_fhg.m 
        % fmin_BFGS_MG.m
            % cd_grad.m
            % LUSolve.m, 
                % LUfac.m, 
                % fsub.m, 
                % bsub.m
            % BFGSupdate.m
    % MTH451_Exam2_3_iTheta_Greisen.pdf
    % MTH451_Exam2_3_XY_Greisen.pdf

% Solution: 

% Defining the function to minimize 

% See Exam2_3_function.m

% Testing Function

%theta_zero=zeros(N,1);
%theta_ones=ones(N,1);
%[V_zero,h_zero,g_zero]=Exam2_3_function(theta_zero)
%[V_ones,h_ones,g_ones]=Exam2_3_function(theta_ones)

% Parameters

N=11;
L=1/(N-1);
tol=10^-4; 
i = 0:20; 
Alpha = [0.5 .^ i];
theta0=ones(N,1);

% Solution

theta=sumt3_MG('Exam2_3_function',theta0, Alpha,tol)
[V, h, g]=Exam2_3_function(theta)


% PLot X vs. Y

x_i=zeros(1,(N-1));
y_i=zeros(1,(N-1));
    
% Plot x vs y 
for i=1:(N-1)
  for j=1:i
    x_i(i)=x_i(i)+L*cos(theta(j));
    y_i(i)=y_i(i)+L*sin(theta(j));
  endfor
endfor

figure
plot(x_i,y_i)
xlabel('X')
ylabel('Y')
title('X vs. Y')
  
% Plot theta vs. i
length_theta=length(theta); 
i=1:length_theta;
figure
plot(i,theta);
xlabel('Value of I')
ylabel('Value of Theta')
title('Theta vs. I')

