function y = genere_elt2(m,sigma2)

%% Ceci correspond à la génération d'une loi normale tronquée aux valeurs positives à partir de la loi exponentielle.

M = 2/(1+erf(m/(2*sigma2))); 
y = genere_exponentielle(m,sigma2);
u = rand(1,1);
f = 1/(sqrt(pi*sigma2/2)*1+erf(m/(2*sigma2)))*exp(-(y-m).^2/(2*sigma2));

while u>f/(M*y)
y = genere_exponentielle(m,sigma2); %génération de y à partir de la loi exponentielle; m + randn(1,1)*sqrt(sigma2);
u = rand(1,1);
f = 1/(sqrt(pi*sigma2/2)*1+erf(m/(2*sigma2)))*exp(-(y-m).^2/(2*sigma2));
end
end

