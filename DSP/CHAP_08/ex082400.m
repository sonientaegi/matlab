% Chapter 8: Example 8.24

%            Elliptic Lowpass Filter Design:

%                Use of the ELLIP function

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



% Analog Elliptic Filter order calculations:

ep = sqrt(10^(Rp/10)-1);             %Passband Ripple Factor

A = 10^(As/20);                      %Stopband Attenuation Factor

OmegaC = OmegaP;                     %Analog Prototype Cutoff freq

k = OmegaP/OmegaS;                   %Analog Prototype Transition Ratio;

k1 = ep/sqrt(A*A-1);                 %Analog Prototype Intermediate cal.

capk = ellipke([k.^2 1-k.^2]);

capk1 = ellipke([(k1 .^2) 1-(k1 .^2)]);

N = ceil(capk(1)*capk1(2)/(capk(2)*capk1(1)));

fprintf('\n*** Elliptic Filter Order = %2.0f \n',N)

%%*** Elliptic Filter Order =  3 



% Digital Elliptic Filter Design:

wn = wp/pi;                          %Digital Passband freq in pi units

[b,a]=ellip(N,Rp,As,wn);

[b0,B,A] = dir2cas(b,a)

%%b0 = 0.1214

%%B = 1.0000   -1.4211    1.0000

%%    1.0000    1.0000         0

%%A = 1.0000   -1.4928    0.8612

%%    1.0000   -0.6183         0