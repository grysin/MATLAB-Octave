%{
Compute the gradient of a scalar function via a central differance
formula

df = df(x)/dx
   = [df/dx_1; df/dx_2; ...; df/dx_n]
   
Input

f : a function that computes f(x)
x : an n-dimensional vector

Output:

df: an n-dimensional vector, the approximate gradient

Example:

% file: fun.m

function f = fun(x)
    f = x(1)*x(1) + sin(pi*x(2)) + exp(x(3));
end

% file: test_grad_fun.m

clear all
x = [2.0; 0.75; -1.0];
df = cd_grad('fun', x);
df_exact = [2.0*x(1); pi*cos(pi*x(2)); exp(x(3))];
abs_error = abs(df_exact-df);
rel_error = abs_error ./ max(abs(df_exact), [1;1;1]);

%}
function df = cd_grad(f, x)
cube_rt_eps = eps^(1.0/3.0);
x1 = x; 
n  = length(x);
df = zeros(n,1);
for i = 1:n
    h = cube_rt_eps * max(abs(x(i)), 1);
    dh = 2.0*h;
    x1(i) = x(i) + h;
    f1 = feval(f, x1);
    x1(i) = x(i) - h;
    f0 = feval(f, x1);
    df(i) = (f1-f0)/dh;
    x1(i) = x(i);
end
