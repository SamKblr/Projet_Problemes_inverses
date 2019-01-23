function y = genere_elt2(m,sigma2)

%% Ceci correspond à la génération d'une loi normale tronquée aux valeurs positives à partir de la loi exponentielle.

lambda = (sqrt(m^2 + 4*sigma2)-m)/(2*sigma2);
M = lambda * sqrt(2 * pi * sigma2) * exp(-lambda * ((3/2)*lambda * sigma2 + m));
y = exprnd(lambda);
u = rand(1,1);
if y <= 0
    f=0;
else
    f = 1/(sqrt(pi*sigma2/2)*(1+erf(m/sqrt(2*sigma2))))*exp(-(y-m)^2/(2*sigma2));
end
g = lambda * exp(-lambda*y);

while u>f/(M*g)
y = exprnd(lambda); %génération de y à partir de la loi exponentielle; m + randn(1,1)*sqrt(sigma2);
u = rand(1,1);
if y <= 0
    f=0;
else
    f = 1/(sqrt(pi*sigma2/2)*(1+erf(m/sqrt(2*sigma2))))*exp(-(y-m)^2/(2*sigma2));
end
g = lambda * exp(-lambda*y);
end
end

