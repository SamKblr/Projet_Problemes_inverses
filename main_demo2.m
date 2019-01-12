
close all

%% Global values

[x3D, y3D] = meshgrid(-10:1:10);

% Define the objective function:
a = 0.5;
b = 8;
c = 0.55;
d = 2;
x0 = [0.5, 1];
f = @(x1, x2) a*atan(d*x1.^2+x2.^2)+b*(x1-x0(1)).^2+c*(x2-x0(2)).^2;
f3D = a*atan(d*x3D.^2+y3D.^2)+b*(x3D-x0(1)).^2+c*(y3D-x0(2)).^2;

% Convergence parameters
epsilon1 = 1e-3;
epsilon2 = 1e-6;
epsilon = epsilon1;

%% Gradient Descent

% Starting point
x1 = -8.8;
x2 = -9.2;
x = [x1, x2];

% Maximum number of allowed iterations
maxiter = 100000;

% Step size
alpha = 0.001;
alphaset = logspace(-5,1,1000);

% Initialize gradient norm, iteration counter
dist = inf; 
IterGD = 1;

% Plot objective function contours for visualization: 
surf(x3D, y3D, f3D)
hold on
title('Gradient')

% Gradient descent algorithm:

smin = inf;

while dist >= epsilon && IterGD <= maxiter
    
    % Calculate gradient:
    g = gradient2(x);
    
    % Take step:
    xnew = x - alpha*g;
    dist = norm(f(x(1), x(2)) - f(xnew(1), xnew(2)));
    
    % alpha optimization
    for j = 1:length(alphaset)
        s = f(x(1)+alphaset(j)*g(1), x(2)+alphaset(j)*g(2));
        if s < smin
            alpha = alphaset(j);
            smin = s;
        end
    end
    
    smin = inf;
    
    % Plot current point
    plot3([x(1) xnew(1)], [x(2) xnew(2)], [f(x(1), x(2)), f(xnew(1), xnew(2))], 'r+-')
    
    % Update termination metrics
    IterGD = IterGD+1;
    x = xnew;
    
end

% Outputs
xopt = x;
fopt = f(xopt(1), xopt(2));
IterGD = IterGD-1;
fprintf('Number of Iterations for Convergence: %d\n\n', IterGD);
fprintf('Point of Minima: [%d,%d]\n\n', xopt);

%% Newton Method

% Starting point
x1 = -0.8;
x2 = -2.2;

% Maximum number of allowed iterations
maxiter = 100000;

% Step size
alpha = 0.0001;
alphaset = logspace(-5,1,1000);

% Initialize gradient norm, iteration counter
dist = inf; 
i = 1;

% Initialize gradient, hessian
g = gradient2([x1(1), x2(1)]);
H = Hessian([x1(1), x2(1)]);
S = inv(H);

% Newton algorithm

smin = inf;

while dist >= epsilon && i <= maxiter
    
    g = gradient([x1(i), x2(i)]);
    H = Hessian([x1(i), x2(i)]);
    S = inv(H); % New Search Direction
    
    if i > 2  
        
        % alpha optimization
        for j = 1:length(alphaset)
            s = f(x1(i-1) + alphaset(j)*g(1), x2(i-1)+ alphaset(j)*g(2));
            if s < smin
                alpha = alphaset(j);
                smin = s;
            end
        end
        
    dist = norm(f(x1(i), x2(i))-f(x1(i-1), x2(i-1)));
    end
    
    x1(i+1) = x1(i)-alpha*S(1,:)*g';
    x2(i+1) = x2(i)-alpha*S(2,:)*g';
    i = i+1;
    
end

% Plots
surf(x3D, y3D, f3D)
hold on;
plot3(x1, x2, f(x1, x2), 'r+-');
grid on;
title('Newton')

% Output
IterNM = i;
fprintf('Number of Iterations for Convergence: %d\n\n', IterNM);
fprintf('Point of Minima: [%d,%d]\n\n', x1(i), x2(i));

