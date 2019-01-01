%% Gradient Descent

% Starting point
x1 = -0.8;
x2 = -2.2;
x = [x1, x2];
% Maximum number of allowed iterations
maxiter = 1000;
% Step size
alpha = 0.0039;
% Initialize gradient norm, iteration counter
dist = inf; 
IterGD = 0;
% Define the objective function:
a = 0.5;
b = 8;
c = 0.55;
d = 2;
x0 = [0.5,1];
f = @(x1,x2) a*atan(d*x1^2+x2^2)+b*(x1-x0(1))^2+c*(x2-x0(2))^2;
% Plot objective function contours for visualization:
figure(1)
clf
fcontour(f,'Fill', 'On') 
axis equal
hold on
title('Gradient')
% Convergence parameters
epsilon1 = 1e-3;
epsilon2 = 1e-6;
epsilon = epsilon1;

% Gradient descent algorithm:

while dist>=epsilon && IterGD <= maxiter
    % Calculate gradient:
    g = gradient(x);
    % Take step:
    xnew = x - alpha*g;
    dist = norm(f(x(1),x(2)) - f(xnew(1),xnew(2)));
    % Plot current point
    plot([x(1) xnew(1)],[x(2) xnew(2)],'ko-')
    refresh
    % Update termination metrics
    IterGD = IterGD + 1;
    x = xnew;
end

% Outputs
xopt = x;
fopt = f(xopt(1), xopt(2));
IterGD = IterGD - 1;

fprintf('Number of Iterations for Convergence: %d\n\n', IterGD);
fprintf('Point of Minima: [%d,%d]\n\n', xopt);

%% Newton Method

% Maximum number of allowed iterations
maxiter = 1000;
% Starting point
x1(1) = -0.8;
x2(1) = -2.2;
% Step size
alpha = 0.0015;
% Initialize gradient norm, iteration counter
dist = inf; 
% Define the objective function:
a = 0.5;
b = 8;
c = 0.55;
d = 2;
x0 = [0.5,1];
f = @(x1,x2) a*atan(d*x1^2+x2^2)+b*(x1-x0(1))^2+c*(x2-x0(2))^2;
% Convergence parameters
epsilon1 = 1e-3;
epsilon2 = 1e-6;
% Initialize counter, gradient, hessian
i = 1;
g = gradient([x1(1), x2(1)]);
H = Hessian([x1(1), x2(1)]);
S = inv(H);

% Newton algorithm

while dist >= epsilon1 && i <= maxiter
    x1(i+1) = x1(i)-alpha*S(1,:)*g';
    x2(i+1) = x2(i)-alpha*S(2,:)*g';
    i = i+1;
    g = gradient([x1(i), x2(i)]);
    H = Hessian([x1(i), x2(i)]);
    S = inv(H); % New Search Direction
    if i > 2
        dist = norm(f(x1(i), x2(i)) - f(x1(i-1), x2(i-1)));
    end
end

% Plots
figure(2); 
fcontour(f, 'Fill', 'On');
hold on;
plot(x1, x2, 'ko-');
grid on;
title('Newton')
% Output
IterNM = i;
fprintf('Number of Iterations for Convergence: %d\n\n', IterNM);
fprintf('Point of Minima: [%d,%d]\n\n', x1(i), x2(i));

