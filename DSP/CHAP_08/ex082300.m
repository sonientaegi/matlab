% Chapter 8: Example 8.23

%            Butterworth Lowpass Filter Design:

%                Use of the CHEBY2 function

%

% Digital Filter Specifications:

wp = 0.2*pi;                         %digital Passband freq in Hz

ws = 0.3*pi;                         %digital Stopband freq in Hz

Rp = 1;                              %Passband ripple in dB

As = 15;                             %Stopband attenuation in dB



% Analog Prototype Specifications:

T = 1;                               %Set T=1

OmegaP = (2/T)*tan(wp/2);            %Prewarp Prototype Passband freq

OmegaS = (2/T)*tan(ws/2);            %Prewarp Prototype Stopband freq

ep = sqrt(10^(Rp/10)-1);             % Passband Ripple parameter

Ripple = sqrt(1/(1+ep*ep));          % Passband Ripple

Attn = 1/(10^(As/20));               % Stopband Attenuation



% Analog Prototype Order Calculation:

ep = sqrt(10^(Rp/10)-1);             %Passband Ripple Factor

A = 10^(As/20);                      %Stopband Attenuation Factor

OmegaC = OmegaP;                     %Analog Prototype Cutoff freq

OmegaR = OmegaS/OmegaP;              %Analog Prototype Transition Ratio

g = sqrt(A*A-1)/ep;                  %Analog Prototype Intermediate cal.

N = ceil(log10(g+sqrt(g*g-1))/log10(OmegaR+sqrt(OmegaR*OmegaR-1)));

fprintf('\n*** Chebyshev-2 Filter Order = %2.0f \n',N)

%%*** Chebyshev-2 Filter Order =  4 



% Digital Chebyshev-II Filter Design:

wn = ws/pi;                          %Digital Stopband freq in pi units

[b,a]=cheby2(N,As,wn);

[b0,B,A] = dir2cas(b,a)

%%b0 = 0.1797

%%B = 1.0000    0.5574    1.0000

%%    1.0000   -1.0671    1.0000

%%A = 1.0000   -0.4183    0.1503

%%    1.0000   -1.1325    0.7183