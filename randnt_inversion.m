function X = randnt_inversion(m, sigma2, N)

u = rand(N,1);

X = sqrt(2*sigma2) * erfinv(u * (1 + erf(m/sqrt(2*sigma2)))-erf(m/sqrt(2*sigma2))) + m;

end
