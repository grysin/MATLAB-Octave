function H = Exam2_slider_crank(x,lambda)
  
  AH=8;
  AB=4; 
  BC=2; 
  AE=8;
  EF=3;
  
  theta1=lambda';
  theta2=x(1);
  theta3=x(2);
  r2=x(3);
  r4=x(4);
  
  H = [BC*cos(theta1)-r2*cos(theta2);
       AB+BC*sin(theta1)-r2*sin(theta2);
       AE*cos(theta2)+EF*cos(theta3)-r4;
       AE*sin(theta2)+EF*sin(theta3)-AH];
       
end
