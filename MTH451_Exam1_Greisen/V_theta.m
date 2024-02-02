function v = V_theta(theta,mode)
  N=length(theta);
  
  p=10^3;
  g=9.8; 
  L=1; 
  u=0.7;
  m=1/(N-1);
  li=L/N;
  
  if mode == 0; % compute function
    
    % focusing on just the first mgh summation
    fpart1_sum=0;
    for i=1:N-1
      h=0;
      for j=1:i
        h=h+li*sin(theta(j));
      endfor
      fpart1_sum=fpart1_sum+(m*g*h);
    endfor

    %focusing on the second cos^2 summation
    fpart2_partial_sum=0;
    for i=1:N
      fpart2_partial_sum=fpart2_partial_sum+li*cos(theta(i));
    endfor
    fpart2_sum=(p/2)*(u*L-fpart2_partial_sum)^2;
    
    %focusing on the third sin^2 summation
    fpart3_partial_sum=0;
    for i=1:N
      fpart3_partial_sum=fpart3_partial_sum+li*sin(theta(i));
    endfor
    fpart3_sum=(p/2)*(fpart3_partial_sum)^2; 
    
    v=fpart1_sum+fpart2_sum+fpart3_sum;
    
    return
  endif
  
  if mode == 1; % compute the gradient 
    
    % focusing on the first term 
    gpart1_cos_sum=0;
    for i=1:N-1
      gpart1_cos_sum=gpart1_cos_sum+cos(theta(i));
    endfor
    gpart1_sum=m*g*li*gpart1_cos_sum;
    
    % focusing on the second term 
    gpart2_cos_sum=0;
    gpart2_sin_sum=0;
    for i=1:N
      gpart2_cos_sum=gpart2_cos_sum+cos(theta(i));
      gpart2_sin_sum=gpart2_sin_sum+sin(theta(i));
    endfor
    gpart2_sum=p*(u*L-(li)*gpart2_cos_sum)*((li)*gpart2_sin_sum);
    
    % focusing on the third term
    gpart3_cos_sum=0;
    gpart3_sin_sum=0;
    for i=1:N
      gpart3_cos_sum=gpart3_cos_sum+cos(theta(i));
      gpart3_sin_sum=gpart3_sin_sum+sin(theta(i)); 
    endfor
    gpart3_sum=p*li^2*gpart3_sin_sum*gpart3_cos_sum;
    
    v=gpart1_sum+gpart2_sum+gpart3_sum;
    
  endif

endfunction
