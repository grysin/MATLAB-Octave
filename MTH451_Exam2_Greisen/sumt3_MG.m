function x = sumt3_MG (fhg,x0,Alpha,tol,fhg_grad)
    global FHG alpha
    FHG = fhg;
    N = length(Alpha);
    x = x0;
    for k = 1:N
        alpha = Alpha(k);
        fprintf('alpha: %g\n', alpha);
        x= fmin_BFGS_MG('phi_fhg',x,tol);
    end
end
