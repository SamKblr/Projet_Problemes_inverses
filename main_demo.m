close all
clc
clear all

%% Simulation of a gaussian law truncated to positive values
% Var
sigma2 = 3;
m = 4;
N = 1e5;
t = linspace(0,10);

% Questions 1-2
X_test = randnt_inversion(m, sigma2, N);
K = sqrt(pi*sigma2/2)*(1+erf(m/sqrt(sigma2*2)));
h = histogram(X_test,100);
hmax = max(h.Values);

% Question 3



%% Affichage ex2


f =  1/K*exp(-(t-m).^2/(2*sigma2));
fmax = max(f);
f = f*hmax/fmax;
hold on
plot(t,f,'r');

