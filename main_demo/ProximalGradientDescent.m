% H doit être tronquée
% y = observations
% x = input
% N = nbre_iterations
% filtre qui a transformé le signal

function [x_opt, IterGD] = ProximalGradientDescent(y, H, lambda)
N=length(y);
xk = ones(N,1);
xk_1 = ones(N,1);

dist = inf;
Nbre_it_max = 100;
epsilon = 1e-5;
IterGD = 1;
alpha = 0.11;
beta = 0.99;
f = @(x) (y - H*x)'*(y - H*x) + lambda * sum(abs(x));
g = @(x) 2*H'*(H*x-y);
big_alpha = [];
while dist>epsilon && IterGD < Nbre_it_max
    grad = g(xk);
    
    % Actualisation du pas avec méthode des résidus
    
    while (y - H*xk)'*(y - H*xk) > (y - H*xk_1)'*(y - H*xk_1) - g(xk_1)' * (xk_1 - xk) + 1/(2*alpha) * (xk_1 - xk)'*(xk_1 - xk)
        alpha = alpha * beta
    end
    
    x_new = proxop(xk - alpha .* grad);
    dist = norm(f(x_new)-f(xk));
    xk_1 = xk;
    xk = x_new;
    IterGD = IterGD + 1;
end

x_opt = xk;
big_alpha = [big_alpha alpha];
plot([1:IterGD],big_alpha,'r+-');

end

