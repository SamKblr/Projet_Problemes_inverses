close all
clc
clear all

%% Simulation of a gaussian law truncated to positive values
% Var
sigma2 = 0.5;
m = 1;
N = 1e4;
t = linspace(0,10);

% Questions 1-2
X_test = randnt_inversion(m, sigma2, N);
K = sqrt(pi*sigma2/2)*(1+erf(m/sqrt(sigma2*2)));
h = histogram(X_test,100);
hmax = max(h.Values);

%% Affichage ex2

f =  1/K*exp(-(t-m).^2/(2*sigma2));
fmax = max(f);
f = f*hmax/fmax;
hold on
plot(t,f,'r');

% Question 3
figure;
X_test_ar1 = randnt_ar1(m,sigma2,N);
h_ar1 = histogram(X_test_ar1,100);

% Question 4

figure;
X_test_ar2 = randnt_ar2(m,sigma2,N);
h_ar2 = histogram(X_test_ar2, 100);
