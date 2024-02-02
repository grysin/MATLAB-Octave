function [X, err] = cont_newton(H, x0, Lambda, tol)
    err = 0;
    n_lambda = length(Lambda);
    n = length(x0);
    X = zeros(n_lambda, n);
    xk_init = x0;
    for ik = 1:n_lambda
        lambda = Lambda(ik);
        [x, err] = newton(H, xk_init, lambda, tol);
        %fprintf('lambda: %g ', lambda); printx(x);
        if err ~= 0
            fprintf('con_newton: err: %d\n', err);
            return
        end
        xk_init = x;
        X(ik,:) = x';
    end
end

function err_p = printx(x)
    err_p = 0;
    for j = 1:length(x)
        fprintf('%g ', x(j));
    end
    fprintf('\n');
end
    
function J = fd_Jac(HJ, x0, lambda, F0)
    F0=feval(HJ,x0,lambda);
    n = length(x0);
    x = x0;
    J = zeros(n,n);
    fac = sqrt(eps);
    for i = 1:n
        h = fac*max(1,abs(x0(i)));
        x(i) = x0(i) + h;
        F = feval(HJ, x, lambda);
        J(:,i) = (F-F0)/h;
        x(i) = x0(i);
    end
end
    

function [x, err_n] = newton(HN, x0, lam, tol)
    MAX_ITER = 20;
    err_n = 0;
    x = x0;
    for kn = 1:MAX_ITER
        F = feval(HN, x, lam);
        nF = norm(F);
        if nF <= tol
            return
        end
        J = fd_Jac(HN, x, lam, F);
        %[d, err_n] = LUsolve(J, -F);  
        d = -J\F;
        %if err_n ~= 0
            %return
        %end
        x = x + d;
        if kn >= MAX_ITER
            err_n = 2;
            return
        end
    end
end
