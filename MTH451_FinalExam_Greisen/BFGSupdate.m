function H = BFGSupdate(H, x, xbar, df, dfbar)
    s = xbar - x;
    y = dfbar - df;
    sy = s'*y;
    if sy > 0
        Hs = H*s;
        sHs = s'*Hs;
        H = H + y*y'/sy - Hs*Hs'/sHs;
    endif
endfunction