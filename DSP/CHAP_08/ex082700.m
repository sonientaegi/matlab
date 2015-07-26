% Chapter 8: Example 8.27

%            Chebyshev-1 Highpass Filter Design:

%                Use of the CHEBY1HPF function

%

% Digital Highpass Filter Specifications:

wp = 0.6*pi;                         % digital Passband freq in Hz

ws = 0.4586*pi;                      % digital Stopband freq in Hz

Rp = 1;                              % Passband ripple in dB

As = 15;                             % Stopband attenuation in dB



[b,a] = cheb1hpf(wp,ws,Rp,As);

[C,B,A] = dir2cas(b,a)

%%C = 0.0243

%%B = 1.0000   -2.0000    1.0000

%%    1.0000   -2.0000    1.0000

%%A = 1.0000    1.0416    0.4019

%%    1.0000    0.5561    0.7647

