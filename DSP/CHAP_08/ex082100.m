% Chapter 8: Example 8.21

%            Butterworth Lowpass Filter Design:

%                Use of the BUTTER function

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

N =ceil((log10((10^(Rp/10)-1)/(10^(As/10)-1)))/(2*log10(OmegaP/OmegaS)));

fprintf('\n*** Butterworth Filter Order = %2.0f \n',N)

%%*** Butterworth Filter Order =  6 

OmegaC = OmegaP/((10^(Rp/10)-1)^(1/(2*N))); %Analog BW prototype cutoff

wn = 2*atan((OmegaC*T)/2);            %Digital BW cutoff freq



% Digital Butterworth Filter Design:

wn = wn/pi;                           %Digital Butter cutoff in pi units

[b,a]=butter(N,wn);

[b0,B,A] = dir2cas(b,a)

%%C = 5.7969e-004

%%B = 1.0000    2.0297    1.0300

%%    1.0000    1.9997    1.0000

%%    1.0000    1.9706    0.9709

%%A = 1.0000   -0.9459    0.2342

%%    1.0000   -1.0541    0.3753

%%    1.0000   -1.3143    0.7149

