close all
clc
clear all

%% Simulation of a gaussian law truncated to positive values
% Var
sigma2 = 2;
m = 4;
N = 1e6;
t = linspace(0,10);


X_test = randnt_inversion(m, sigma2, N);


K = sqrt(pi*sigma2/2)*(1+erf(m/sqrt(sigma2*2)));

h = histogram(X_test,100);

%% Affichage

f =  1/K*exp(-(t-m).^2/(2*sigma2));
hold on
plot(t,f,'r');