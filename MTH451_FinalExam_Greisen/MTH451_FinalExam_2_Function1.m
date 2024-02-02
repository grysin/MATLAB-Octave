function Q = MTH451_FinalExam_2_Function1 (q)
  
  q1=q(1); % q1 = x , position
  q2=q(2); % q2 = x dot , velocity
  q3=q(3); % q3 = theta , anglular position
  q4=q(4); % q4 = theta dot, angular velocity
  
  q1_dot=q2;
  q3_dot=q4;
  
  m1=0.5;
  m2=0.1;
  L=0.25;
  g=9.8;
  
  % First situation where there is no force
  F=0;
  
  % Solve for q2_dot (acceleration) and q4_dot (angular acceleration)
  % Ax=b
  A = [ m1+m2 , m2*L*cos(q3); 
        cos(q3), L];
        
  b = [F-m2*L*q4^2*sin(q3);
       g*sin(q3)];
       
  x=A\b;
  
  q2_dot=x(1);
  q4_dot=x(2);
  
  Q=[q1_dot;q2_dot;q3_dot;q4_dot];
  
endfunction
