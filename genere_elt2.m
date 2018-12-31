function y = genere_elt2(m,sigma2)
% Dans un premier temps, il faut générer des échantillons de la loi
% exponentielle en partant de la loi normale.


lambda = (sqrt(m^2+4*sigma2)-m)/(2*sigma2);
% M_old = 2/(1+erf(m/(2*sigma2))); 
% M = lambda* sqrt(pi * sigma2)* exp(-(lambda^2*sigma2/2+m))/M_old; %Il faut recalculer M à partir de la loi exponentielle
% y = lambda * exp(-lambda * randn(1,1)); % génération de y à partir de la loi exponentielle ;m + randn(1,1)*sqrt(sigma2);
% u = rand(1,1);
% f = 1/(sqrt(pi*sigma2/2)*1+erf(m/(2*sigma2)))*exp(-(y-m).^2/(2*sigma2));
% 
% while u>f/(M*y)
% y = lambda * exp(-lambda * randn(1,1)); %génération de y à partir de la loi exponentielle; m + randn(1,1)*sqrt(sigma2);
% u = rand(1,1);
% f = 1/(sqrt(pi*sigma2/2)*1+erf(m/(2*sigma2)))*exp(-(y-m).^2/(2*sigma2));
% end

%% Ceci correspond à la génération d'une loi exponentielle
y = sigma2 * randn(1,1) + m;
v = rand;
f = lambda * exp(- lambda * y);

while (v>f/y)
    y = sigma2 * randn(1,1) + m;
    v = rand;
    f = lambda * exp(- lambda * y);
end

end

