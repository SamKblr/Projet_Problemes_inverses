% H doit être tronquée
% y = observations
% x = input
% N = nbre_iterations
% filtre qui a transformé le signal

function [x_opt] = ProximalGradientDescent(H, y, lambda)
N=length(y);
xk = ones(N,1);
dist = inf;
Nbre_it_max = 100;
epsilon = 1e-5;
IterGD = 1;
alpha = 0.1;

f = @(x) (y - H*x)'*(y - H*x) + lambda * sum(abs(x));
g = @(x) 2*sqrt((y - H*x)'*(y - H*x)) + lambda;

%% Estimation du 


while dist>epsilon && IterGD < Nbre_it_max
    grad = g(xk);
    x_new = xk - alpha .* grad;
    dist = norm(f(x_new)-f(xk));
    xk = x_new;
    IterGD = IterGD + 1;
end

x_opt = xk;
%%Etape 1 Calcul du gradient de f

%%Etape 2 Calcul du pas de descente

% Dans un premier temps, on estime le pas cst.

%%Etape 3 Calcul de l'operateur proximal (à chaque itération il faut lancer
%%un problème d'optimisation sur cet opérateur).

%%Etape4 Actualisation de la pos de des


end

