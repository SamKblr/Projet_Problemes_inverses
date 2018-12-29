function y = genere_elt2(m,sigma2)
M = %Il faut recalculer M à partir de la loi exponentielle
y = % génération de y à partir de la loi exponentielle ;m + randn(1,1)*sqrt(sigma2);
u = rand(1,1);
f = 1/(sqrt(pi*sigma2/2)*1+erf(m/(2*sigma2)))*exp(-(y-m).^2/(2*sigma2));

while u>f/(M*y)
y = %génération de y à partir de la loi exponentielle; m + randn(1,1)*sqrt(sigma2);
u = rand(1,1);
f = 1/(sqrt(pi*sigma2/2)*1+erf(m/(2*sigma2)))*exp(-(y-m).^2/(2*sigma2));
end

end

