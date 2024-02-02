% Matthew D. Greisen
% MTH 451, Spring 2021
% Final Exam Problem 4

% FILES RELATING TO THIS PROBLEM: 

      % fmin_BFGS.m
          % cd_grad.m
          % BFGSupdate.m
      % MTH451_FinalExam_4CostFunction.m
          % RK43.m
          % MTH451_FinalExam_4ODEFunction.m

% SOLUTION: 

% Test of integrating ODE function --------------

%q=[0;0;0;0;0];
%t=0;
%z=ones(10,1);

%Q = MTH451_FinalExam_4ODEFunction (q, t, z);

% Test of computing cost function  ------------------

%J = MTH451_FinalExam_4CostFunction (z)

% Mimizing the cost function --------------------------
z5=ones(10,1);
z10=zeros(20,1);
z15=zeros(30,1);
tol=10^-6;

tic 
z_min_p5=fmin_BFGS('MTH451_FinalExam_4CostFunction',z5,tol)
toc

% Is unable to reach tolerance of 10^-6
% too small of a stepsize error early on in after 70 iterations, fmin_BFGS, 

% [ 13.3239;
%  -31.2735;
%   60.8051;
%  -102.4073;
%   46.3816;
%   3.3492;
%  -6.5941;
%   2.9933;
%  -3.2846;
%  -.5247 ];

tic
z_min_p10=fmin_BFGS('MTH451_FinalExam_4CostFunction',z10,tol)
toc

% Converges after 131 iterations, 281 seconds 

% [  13.1941
%  -27.5063
%   35.5610
%  -40.2765
%  -11.2341
%    7.8330
%    8.5701
%    2.3378
%   -1.8104
%    0.3061
%    3.3313
%   -6.2368
%    1.9236
%   -4.1761
%    2.7304
%    2.3120
%   -2.0789
%   -4.6471
%   -2.3716
%    5.2375  ]

%tic 
%z_min_p15=fmin_BFGS('MTH451_FinalExam_4CostFunction',z15,tol)
%toc