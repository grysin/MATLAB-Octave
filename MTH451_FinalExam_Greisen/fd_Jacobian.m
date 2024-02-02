function J = fd_Jacobian(F, x)
sqrt_eps = sqrt(eps); % square root machine epsilon
Fa = feval(F, x);     % compute Fa = F(x)
y = x;                % copy x
m = length(Fa);
n = length(x);
J = zeros(m, n);
for i = 1:n
    h = sqrt_eps*max(abs(x(i)), 1);
    y(i) = x(i) + h;    % increment the i-th variable in x
    Fb = feval(F, y);
    J(:,i) = (Fb - Fa) ./ h; % set i-th column of J
    y(i) = x(i);
end
