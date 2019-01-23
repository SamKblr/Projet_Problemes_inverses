function y = genere_elt(m,sigma2)
M = 2/(1+erf(m/(2*sigma2))); 
y = m + randn(1,1)*sqrt(sigma2);
u = rand(1,1);
if y <= 0
    f=0;
else
    f = 1/(sqrt(pi*sigma2/2)*(1+erf(m/sqrt(2*sigma2))))*exp(-(y-m)^2/(2*sigma2));
end

g = 1/sqrt(2*pi*sigma2)*exp(-(y-m)^2/(2*sigma2));
while u>f/(M*g)
y = m + randn(1,1)*sqrt(sigma2);
u = rand(1,1);
if y <= 0
    f=0;
else
    f = 1/(sqrt(pi*sigma2/2)*(1+erf(m/sqrt(2*sigma2))))*exp(-(y-m)^2/(2*sigma2));
end
g = 1/sqrt(2*pi*sigma2)*exp(-(y-m)^2/(2*sigma2));
end

end

