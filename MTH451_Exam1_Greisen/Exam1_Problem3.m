function x = Exam1_Problem3 (x0,tol)

% given values for Q and b

Q = [1, 5, 6, 7, 8;
     5, 26, 31, 36 41;
     6, 31, 38, 44, 50; 
     7, 36, 44, 52, 59; 
     8, 41, 50, 59, 68] ;
  
b = [65; 335; 406; 475; 540] ;

% part (a), define function and gradient 

func=@(x) (1/2)*(x'*Q*x)-(b'*x); 
grad=@(x) Q*x-b; 

% part (b), defining equation for exact line search alpha

alpha=@(d) (d'*d)/(d'*Q*d); 

% part (c), creating for loop to implement algorithm

% define max iteration
max_iter = 7500; 

% set x equal to initial guess
x=x0;

%set up inf_norm vector to be used in plotting 
inf_norm=zeros(1,max_iter);
count=0

for i = 1:max_iter
  
  % count to be used in plotting
  count=count+1;
  
  % compute the functional value of x
  f=func(x); 
  
  % compute d
  d=-1*grad(x);
  
  % compute the norm of d
  norm_d=norm(d);
  
  % compute the infinity norm of d
  inf_norm(i)=norm(d,'Inf');
  
  % print out the iteration number, functional value, and norm of d
  fprintf("iter: %4d f: %10.4e |df|: %10.4e\n", i, f, norm_d);
  
  % if norm of d is less than tolerance, end
  if norm_d <= tol;
    x
    f
    d
    a
    break
  endif

  % solve for the exact line search alpha 
  a=alpha(d); 
  
  % update x with d and alpha
  x=x+a*d; 
endfor

inf_norm=inf_norm(1:count);
x=1:1:count;

figure
loglog(x,inf_norm);
xlabel('Iteration Number LOG SCALE')
ylabel('Infinity Norm of d LOG SCALE')
title('Infinity Norm vs Iteration Number on LOG SCALE')

figure
plot(x,inf_norm); 
xlabel('Iteration Number')
ylabel('Infinity Norm of d')
title('Infinity Norm vs Iternation Number')

endfunction
