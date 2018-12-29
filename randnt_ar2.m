function X = randnt_ar2(m,sigma2,N)
X = [];
for i=1:N
    X = [X genere_elt2(m,sigma2)];
end

