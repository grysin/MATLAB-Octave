
% The purpose of this script was to check to see how V_theta was operating

theta0=[0;0;0;0;0;0;0;0;0;0;0];
theta1=[1;1;1;1;1;1;1;1;1;1;1];
thetaN1=[-1;-1;-1;-1;-1;-1;-1;-1;-1;-1;-1];
theta2=[2;2;2;2;2;2;2;2;2;2;2];
thetaC=[1;2;3;4;5;6;7;8;9;10;11];

v0=feval('V_theta',theta0,0);
v1=feval('V_theta',theta1,0);
vN1=feval('V_theta',thetaN1,0);
v2=feval('V_theta',theta2,0);
vC=feval('V_theta',thetaC,0);

gradient=feval('V_theta',theta0,1);