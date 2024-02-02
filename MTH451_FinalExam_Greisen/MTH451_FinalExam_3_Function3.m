function Y = MTH451_FinalExam_3_Function3 (y,t)
  
  u=1000;
  
  Y=[y(2);
     u*(1-y(1)^2)*y(2)-y(1)];

endfunction