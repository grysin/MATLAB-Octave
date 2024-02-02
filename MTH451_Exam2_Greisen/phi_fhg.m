function phi = phi_fhg(x)
    global FHG alpha
    [f, h, g] = feval(FHG, x);
    m = length(h);
    p = length(g);
    s = 0;
    for j = 1:m
        s = s + h(j)*h(j);
    end
    for i = 1:p
        s = s + max(0,g(i))^2;
    end
    phi = f + s/(2*alpha);
end
