%% main_deconvolution_OMP.m
%
%% forward model:
% y = H*x + e
%   H - convolution matrix
%   x - sparse vector of coefficients
%   e - i.i.d Gaussian noise


clear all


% 1D signal
N = 2^8;    % signal length
NSP=10;     % number of spikes

% wavelet
n_wav = 32; [wav,supp_wave] = morlet(-3,3,n_wav);

% simulation setup
SNRdB = 10; % signal to noise ratio
POSITIVITY=1; % constrain coefficients x to be positive
MC=100;     % number of independent realizations

nit=100;    % maximum number of iterations

% matrix formulation
H =  convmtx(wav',N); H_trunc = H(n_wav/2:(end-n_wav/2),:);

tic
for i=1:MC
    % generate spike train and add noise
    [x,y,y_noisy,sigma2] = generate_spiketrain(N,NSP,SNRdB,wav,n_wav,POSITIVITY);
    
    % orthogonal matching pursuit
    x_omp   =orthogonalmatchingpursuit(y_noisy,H_trunc,sqrt(sigma2*N),nit);
    
    % proximal descent 
    [x_opt_prox, nbre_iteration_prop] = ProximalGradientDescent(y_noisy,H_trunc, 1)
    % MCMC
    % ...
    
    % performance analysis
    NZMP(i)=length(find(abs(x_omp)>1e-8));              % number of non-zero elements
    MRESMP(i)=sum((x(:)-x_omp(:)).^2)/sum(x(:).^2);     % relative mean squared error
end
toc
disp(['OMP - relative MSE=',num2str(mean(MRESMP)),' (',num2str(mean(NZMP)),' average non-zero coefficients)']);

