function [x,err] = LUsolve(A,b)
    x = [];
    err = 0;
    [L,U,err] = LUfac(A);
    if err ~= 0
        return;
    end
    [y,err] = fsub(L,b);
    if err ~= 0
        return;
    end
    [x,err] = bsub(U,y);
    if err ~= 0
        return;
    end
end
