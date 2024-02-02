function [x, err] = fmin_BFGS(f,y,tol,f_grad)
    MAX_ITER = 1000; MAX_LS = 20; beta = 0.5; sigma = 0.001;
    err = 0;
    n = length(y); H = eye(n); x = y; f0 = feval(f,x);
    if nargin == 4
        df = feval(f_grad,x);
    else
        df = cd_grad(f,x);
    end
    for k=1:MAX_ITER
        ndf = norm(df);
        fprintf("iter: %4d f: %10.4e |df|: %10.4e\n", k, f0, ndf);
        if ndf <= tol
            return
        end
        %[d, err] = -LUsolve(H,df);
        %d = -LUsolve(H,df);
        d=-H\df;
        if err ~= 0
            fprintf('fmin_BFGS: Error, unable to solve the linear system\n');
            err = 1;
            return
        end
        df_d = df'*d;
        for j=0:MAX_LS
            xbar = x + (beta^j)*d;
            f1 = feval(f,xbar);
            delta_f = f1-f0;
            %fprintf("    j: %3d delta_f: %10.4e\n", j, delta_f);
            if delta_f <= sigma*(beta^j)*df_d
                break
            end
            if j >= MAX_LS
                fprintf('fmin_BFGS: Error, too many line search iterations\n');
                err = 2;
                return
            end
        end % j-loop
        if k >= MAX_ITER
            fprintf('fmin_BFGS: Error, too many iterations\n');
            err = 3;
            return;
        end
        if nargin == 4
            dfbar = feval(f_grad,xbar);
        else
            dfbar = cd_grad(f,xbar);
        end
        H = BFGSupdate(H, x, xbar, df, dfbar);
        f0 = f1; x = xbar; df = dfbar;
    end % k-loop
end % function
