%% Gradient descent

% starting point
x1 = -0.8;
x2 = -2.2;
x = [x1, x2];
% maximum number of allowed iterations
maxiter = 1000;
% step size
alpha = 0.0039;
% initialize gradient norm, iteration counter
dist = inf; niter = 0;
% define the objective function:
a = 0.5;
b = 8;
c = 0.55;
d = 2;
x0 = [0.5,1];
f = @(x1,x2) a*atan(d*x1^2+x2^2)+b*(x1-x0(1))^2+c*(x2-x0(2))^2;
% plot objective function contours for visualization:
figure(1); clf; fcontour(f); axis equal; hold on

% gradient descent algorithm:

epsilon1 = 1e-3;
epsilon2 = 1e-6;

while and(dist>=epsilon1, niter <= maxiter)
    % calculate gradient:
    g = gradient(x);
    % take step:
    xnew = x - alpha*g;
    dist = norm(f0(x) - f0(xnew));
    % plot current point
    plot([x(1) xnew(1)],[x(2) xnew(2)],'ko-')
    refresh
    % update termination metrics
    niter = niter + 1;
    x = xnew;
end

xopt = x;
fopt = f(xopt(1), xopt(2));
niter = niter - 1;
