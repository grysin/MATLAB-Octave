function P = MTH451_FinalExam1_P (theta1,theta2)
  
  r1=0.963;
  r5=0.778;
  delta_deg=-89.65;
  delta_rad=delta_deg*pi/180;
  
  P=[r1*cos(theta1)+r5*cos(theta2+delta_rad);
     r1*sin(theta1)+r5*sin(theta2+delta_rad) ];



endfunction
