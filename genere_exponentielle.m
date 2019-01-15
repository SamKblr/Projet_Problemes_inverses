function y = genere_exponentielle(m,sigma2)
% Dans un premier temps, il faut générer des échantillons de la loi
% exponentielle en partant de la loi normale.

lambda = (sqrt(m^2+4*sigma2)-m)/(2*sigma2);
M = lambda * sqrt(2 * pi * sigma2) * exp(-lambda * ((3/2)*lambda * sigma2 + m));

%% Ceci correspond à la génération d'une loi exponentielle
y = sigma2 * randn(1,1) + m;
v = rand;
f = lambda * exp(- lambda * y);

while (v>f/(y * M))
    y = sigma2 * randn(1,1) + m;
    v = rand;
    f = lambda * exp(- lambda * y);
end
end

