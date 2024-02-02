% Matthew D. Greisen
% MTH 451, Spring 2021
% Exam 1 Problem 2

% FILES RELATING TO THIS PROBLEM: 
  % exam1_forward_substitution.m
  % exam1_backward_substitution.m

% for part (a) please see exam1_forward_substitution.m
% Test of exam1_forward_substitution.m

L_test=[4,0,0,0;
        3,4,0,0;
        2,4,4,0;
        1,1,4,2];
  
b_test=[4,8;
        15,22; 
        34,44;
        38,46];

y_test=exam1_forward_substitution(L_test,b_test);
% correct 

% for part (b) please see exam1_backward_substitution.m
% Test of exam1_backward_substitution.m
U_test=[4,3,1,3;
        0,3,3,4;
        0,0,4,4;
        0,0,0,2];

y_test=[60,49;
        38,28;
        24,16;
        4,2];
        
x_test=exam1_backward_substitution(U_test,y_test);
% correct


% for part (c) please see exam1_LUSolve.m 

% part (d) 

% define both values of n to be used later
n5=5;
n13=13;

% create the H matrix in the case where n=5
for i=1:n5; 
  for j=1:n5; 
    H5(i,j)=1/(i+j-1); 
  endfor
endfor
H5;

% use the function to calculate X (the inverse of H matrix)
X_N5=exam1_LU_Inverse(H5)

% define a identity matrix the size of H to calculate error of X 
[n5,m5]=size(X_N5);
I5=eye(n5,m5);

% calculate error of X
Error_N5=norm(H5*X_N5-I5,'Inf')

% repeat for the case that n=13
 for i=1:n13
   for j=1:n13
     H13(i,j)=1/(i+j-1); 
   endfor
 endfor
H13;

X_N13=exam1_LU_Inverse(H13)

[n13,m13]=size(X_N13);
I13=eye(n13,m13);

Error_N13=norm(H13*X_N13-I13,'Inf')