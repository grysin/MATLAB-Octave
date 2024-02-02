function F = MTH451_FinalExam_1_FourBar (theta,lambda)
  
  theta1=lambda;
  theta2=theta(1);
  theta3=theta(2);
  
  r1=0.963;
  r2=0.764;
  r3=0.528;
  r4=1.815;
  
  F = [r1*cos(theta1)+r2*cos(theta2)-r3*cos(theta3)-r4;
       r1*sin(theta1)+r2*sin(theta2)-r3*sin(theta3) ];

endfunction
