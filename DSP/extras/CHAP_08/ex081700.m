% Chapter 8: Example 8.17

%            BiLinear Transformation:

%                Butterworth Lowpass Filter Design

%

% Digital Filter Specifications:

wp = 0.2*pi;                         % digital Passband freq in Hz

ws = 0.3*pi;                         % digital Stopband freq in Hz

Rp = 1;                              % Passband ripple in dB

As = 15;                             % Stopband attenuation in dB



% Analog Prototype Specifications: Inverse mapping for frequencies

T = 1; Fs = 1/T;                     % Set T=1

OmegaP = (2/T)*tan(wp/2);            % Prewarp Prototype Passband freq

OmegaS = (2/T)*tan(ws/2);            % Prewarp Prototype Stopband freq

ep = sqrt(10^(Rp/10)-1);             % Passband Ripple parameter

Ripple = sqrt(1/(1+ep*ep));          % Passband Ripple

Attn = 1/(10^(As/20));               % Stopband Attenuation



% Analog Butterworth Prototype Filter Calculation:

[cs,ds] = afd_butt(OmegaP,OmegaS,Rp,As);

%%*** Butterworth Filter Order =  6 



% Bilinear transformation:

[b,a] = bilinear(cs,ds,T);

[C,B,A] = dir2cas(b,a)

%%C = 5.7969e-004

%%B = 1.0000    2.0183    1.0186

%%    1.0000    1.9814    0.9817

%%    1.0000    2.0004    1.0000

%%A = 1.0000   -0.9459    0.2342

%%    1.0000   -1.0541    0.3753

%%    1.0000   -1.3143    0.7149



% Plotting

figure(1); subplot(1,1,1)

[db,mag,pha,grd,w] = freqz_m(b,a);

subplot(2,2,1); plot(w/pi,mag); title('Magnitude Response')

xlabel('frequency in pi units'); ylabel('|H|'); axis([0,1,0,1.1])

set(gca,'XTickMode','manual','XTick',[0,0.2,0.3,1]);

set(gca,'YTickmode','manual','YTick',[0,Attn,Ripple,1]); grid

subplot(2,2,3); plot(w/pi,db); title('Magnitude in dB');

xlabel('frequency in pi units'); ylabel('decibels'); axis([0,1,-40,5]);

set(gca,'XTickMode','manual','XTick',[0,0.2,0.3,1]);

set(gca,'YTickmode','manual','YTick',[-50,-15,-1,0]); grid

set(gca,'YTickLabelMode','manual','YTickLabels',['50';'15';' 1';' 0'])

subplot(2,2,2); plot(w/pi,pha/pi); title('Phase Response')

xlabel('frequency in pi units'); ylabel('pi units'); axis([0,1,-1,1]);

set(gca,'XTickMode','manual','XTick',[0,0.2,0.3,1]);

set(gca,'YTickmode','manual','YTick',[-1,0,1]); grid

subplot(2,2,4); plot(w/pi,grd); title('Group Delay')

xlabel('frequency in pi units'); ylabel('Samples'); axis([0,1,0,10])

set(gca,'XTickMode','manual','XTick',[0,0.2,0.3,1]);

set(gca,'YTickmode','manual','YTick',[0:2:10]); grid



