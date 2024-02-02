function H = Exam2_lifting_rig (y)
  
  theta=y(1);
  alpha=y(2);
  v=y(3);
  
  M=0.4; 
  k=0.25; 
  h=3.0;
  c=1.3; 
  
  L=sqrt(h^2+(c-1)^2);
  
  cos_B=(1/L)*(-c*cos(alpha)+sqrt(c^2*((cos(alpha))^2-1)+1));
  
  sin_B=sqrt(1-cos_B^2);
  
  delta_cos_B=((c*sin(alpha))/L)*(1-(c*cos(alpha))/sqrt(1-c^2*(sin(alpha))^2));
  
  delta_sin_B=-delta_cos_B*(cos_B/sin_B);

  H= [ -(c*k-M)*sin(theta)+L*(sin_B-k*cos_B)*sin(theta+alpha)+v*(c*cos(theta)+L*cos_B*cos(theta+alpha));
      L*(sin_B-k*cos_B)*sin(theta+alpha)-L*(delta_sin_B-k*delta_cos_B)*cos(theta+alpha)+v*L*(sin(theta+alpha)*delta_cos_B+cos_B*cos(theta+alpha))];


endfunction
