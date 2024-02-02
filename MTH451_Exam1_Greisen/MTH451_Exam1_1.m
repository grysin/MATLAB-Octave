% Matthew D. Greisen
% MTH 451, Spring 2021
% Exam 1 Problem 1 


% FILES RELATING TO THIS PROBLEM: 
  % MTH451_Exam1Problem1_Greisen.pdf
  % exam1_forward_difference_gradient.m

% For parts (a) and (b) see the attached MTH451_Exam1Problem1_Greisen.pdf

% part (c) see exam1_forward_difference_gradient.m

% define the inline function 
f=@(x) (4*x(1)^2+2*x(2)^2+4*x(1)*x(2)+2*x(2)+1)*exp(x(1)); 

% define the points that will be used to test the gradient function
testpoint1=[-1,1];
testpoint2=[10,10^-3];

% solve for the numberical gradient using forward difference function

numerical_gradient1=exam1_forward_difference_gradient(f,testpoint1);
numerical_gradient2=exam1_forward_difference_gradient(f,testpoint2);

% define partial derivative functions that will be used to solve for the analytical 
% solution that will be used to calculate relative and absolute error
partial_derivative_x1 = @(x) exp(x(1))*(4*x(1)^2+4*x(1)*(x(2)+2)+2*x(2)^2+6*x(2)+1);
partial_derivative_x2 = @(x) exp(x(1))*(4*x(1)+4*x(2)+2);

% define vectors that will store analytical gradients
analytical_gradient1=zeros(2,1);
analytical_gradient2=zeros(2,1);

% solve for analytical gradients
analytical_gradient1(1)=partial_derivative_x1(testpoint1);
analytical_gradient1(2)=partial_derivative_x2(testpoint1);

% display both analytical and numerical gradients
numerical_gradient1
analytical_gradient1

% solve for relative and absolute errors
absolute_error_1=abs(numerical_gradient1-analytical_gradient1)
relative_error_1=absolute_error_1./max(1,abs(analytical_gradient1))

% repeat solve for second test point
analytical_gradient2(1)=partial_derivative_x1(testpoint2);
analytical_gradient2(2)=partial_derivative_x2(testpoint2);

% display both solutions for second test point
numerical_gradient2
analytical_gradient2

% solve for relative and absolute errors
absolute_error_2=abs(numerical_gradient2-analytical_gradient2)
relative_error_2=absolute_error_2./max(1,abs(analytical_gradient2))


%