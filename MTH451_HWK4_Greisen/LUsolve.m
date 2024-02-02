function x = LUsolve(A,b)
[L,U] = LUfac(A);
y = fsub(L,b);
x = bsub(U,y);
