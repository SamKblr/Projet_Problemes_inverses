function X = randnt_ar1(m,sigma2,N)
X = [];
for i=1:N
    X = [X genere_elt(m,sigma2)];
end

