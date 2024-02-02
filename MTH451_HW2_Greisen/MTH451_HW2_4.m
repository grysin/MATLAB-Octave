% Matthew D. Greisen
% MTH451A
% Homework 2, Problem #4

% Given problem matrices

A1 = [1  ,  1  ,  1  ,  1 ,   1;
    1  ,  2  ,  3  ,  4 ,   5;
    1  ,  3  ,  6  , 10 ,  15;
    1  ,  4  , 10  , 20 ,  35;
    1  ,  5  , 15  , 35 ,  70];
    


A2 =[611 ,  196 , -192 ,  407 ,   -8 ,  -52 ,  -49 ,   29;
   196 ,  899 ,  113 , -192 ,  -71 ,  -43 ,   -8 ,  -44;
  -192 ,  113 ,  899 ,  196 ,   61 ,   49 ,    8 ,   52;
   407 , -192 ,  196 ,  611 ,    8 ,   44 ,   59 ,  -23;
    -8 ,  -71 ,   61 ,    8 ,  411 , -599 ,  208 ,  208;
   -52 ,  -43 ,   49 ,   44 , -599 ,  411 ,  208 ,  208;
   -49 ,   -8 ,    8 ,   59 ,  208 ,  208 ,   99 , -911;
    29 ,  -44 ,   52 ,  -23 ,  208 ,  208 , -911 ,   99];
    

    
A3 = [1.000000 ,  0.500000 ,  0.333333 ,  0.250000 ,  0.200000 ,  0.166667;
   0.500000 ,  0.333333 ,  0.250000 ,  0.200000 ,  0.166667 ,  0.142857;
   0.333333 ,  0.250000 ,  0.200000 ,  0.166667 ,  0.142857 ,  0.125000;
   0.250000 ,  0.200000 ,  0.166667 ,  0.142857 ,  0.125000 ,  0.111111;
   0.200000 ,  0.166667 ,  0.142857 ,  0.125000 ,  0.111111 ,  0.100000;
   0.166667 ,  0.142857 ,  0.125000 ,  0.111111 ,  0.100000 ,  0.090909];
   

   
A4 = [1 ,  1  , 1 ,  1 ,  1 ,  1 ,  1 ,  1;
   1 , -1  , 1 , -1 ,  1 , -1 ,  1 , -1;
   1 ,  1  ,-1 , -1 ,  1 ,  1 , -1 , -1;
   1 , -1  ,-1 ,  1 ,  1 , -1 , -1 ,  1;
   1 ,  1  , 1 ,  1 , -1 , -1 , -1 , -1;
   1 , -1  , 1 , -1 , -1 ,  1 , -1 ,  1;
   1 ,  1  ,-1 , -1 , -1 , -1 ,  1 ,  1;
   1 , -1  ,-1 ,  1 , -1 ,  1 ,  1 , -1];

    
   
% Solve for Q and R using both methods for each A matrix

[Q1,R1]=qr_gs(A1);
[Q1m,R1m]=modified_qr_gs(A1);

[Q2,R2]=qr_gs(A2);
[Q2m,R2m]=modified_qr_gs(A2);

[Q3,R3]=qr_gs(A3);
[Q3m,R3m]=modified_qr_gs(A3);

[Q4,R4]=qr_gs(A4);
[Q4m,R4m]=modified_qr_gs(A4);

% Set up identity matrices for error calculation

[m1,n1]=size(A1);
I1=eye(m1,n1);

[m2,n2]=size(A2);
I2=eye(m2,n2);

[m3,n3]=size(A3);
I3=eye(m3,n3);

[m4,n4]=size(A4);
I4=eye(m4,n4);

% Solve for the error with both methods 

QR_error_1=norm(Q1*R1-A1,'INF')
QQ_error_1=norm(Q1'*Q1-I1, 'INF') 

QR_modified_error_1=norm(Q1m*R1m-A1,'INF')
QQ_modified_error_1=norm(Q1m'*Q1m-I1, 'INF') 

QR_error_2=norm(Q2*R2-A2,'INF')
QQ_error_2=norm(Q2'*Q2-I2, 'INF') 

QR_modified_error_2=norm(Q2m*R2m-A2,'INF')
QQ_modified_error_2=norm(Q2m'*Q2m-I2, 'INF') 

QR_error_3=norm(Q3*R3-A3,'INF')
QQ_error_3=norm(Q3'*Q3-I3, 'INF') 

QR_modified_error_3=norm(Q3m*R3m-A3,'INF')
QQ_modified_error_3=norm(Q3m'*Q3m-I3, 'INF') 

QR_error_4=norm(Q4*R4-A4,'INF')
QQ_error_4=norm(Q4'*Q4-I4, 'INF') 

QR_modified_error_4=norm(Q4m*R4m-A4,'INF')
QQ_modified_error_4=norm(Q4m'*Q4m-I4, 'INF') 