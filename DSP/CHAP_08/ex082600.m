% Chapter 8: Example 8.26

%            Chebyshev-1 Highpass Filter Design:

%                Use of the ZMAPPING function

%

% Digital Lowpass Filter Specifications:

wplp = 0.2*pi;                         % digital Passband freq in Hz

wslp = 0.3*pi;                         % digital Stopband freq in Hz

  Rp = 1;                              % Passband ripple in dB

  As = 15;                             % Stopband attenuation in dB



% Analog Prototype Specifications: Inverse mapping for frequencies

T = 1; Fs = 1/T;                       % Set T=1

OmegaP = (2/T)*tan(wplp/2);            % Prewarp Prototype Passband freq

OmegaS = (2/T)*tan(wslp/2);            % Prewarp Prototype Stopband freq

ep = sqrt(10^(Rp/10)-1);               % Passband Ripple parameter

Ripple = sqrt(1/(1+ep*ep));            % Passband Ripple

Attn = 1/(10^(As/20));                 % Stopband Attenuation



% Analog Chebyshev Prototype Filter Calculation:

[cs,ds] = afd_chb1(OmegaP,OmegaS,Rp,As);

%%*** Chebyshev-1 Filter Order =  4 



% Bilinear transformation:

[blp,alp] = bilinear(cs,ds,T);



% Digital Highpass Filter Cutoff frequency:

wphp = 0.6*pi;                            % Passband edge frequency



% LP-to-HP frequency-band transformation:

alpha = -(cos((wplp+wphp)/2))/(cos((wplp-wphp)/2))

%%alpha = -0.3820



Nz = -[alpha,1]; Dz = [1,alpha];

[bhp,ahp] = zmapping(blp,alp,Nz,Dz);

[C,B,A] = dir2cas(bhp,ahp)

%%C = 0.0243

%%B = 1.0000   -2.0000    1.0000

%%    1.0000   -2.0000    1.0000

%%A = 1.0000    1.0416    0.4019

%%    1.0000    0.5561    0.7647



% Plotting

figure(1); subplot(1,1,1)

[dbl,magl,phal,grdl,w] = freqz_m(blp,alp);

subplot(2,2,1); plot(w/pi,magl); title('Lowpass Filter Magnitude Response')

xlabel('frequency in pi units'); ylabel('|H|'); axis([0,1,0,1]);

set(gca,'XTickMode','manual','XTick',[0,0.2,1]);

set(gca,'YTickMode','manual','YTick',[0,Ripple,1]);grid

subplot(2,2,2); plot(w/pi,dbl); title('Lowpass Filter Magnitude in dB');

xlabel('frequency in pi units'); ylabel('decibels'); axis([0 1 -30 0]);

set(gca,'XTickMode','manual','XTick',[0,0.2,1])

set(gca,'YTickMode','manual','YTick',[-30,-Rp,0]);grid

set(gca,'YTickLabelMode','manual','YTickLabels',['30';' 1';' 0']);

[dbh,magh,phah,grdh,w] = freqz_m(bhp,ahp);

subplot(2,2,3); plot(w/pi,magh); title('Highpass Filter Magnitude Response')

xlabel('frequency in pi units'); ylabel('|H|'); axis([0,1,0,1])

set(gca,'XTickMode','manual','XTick',[0,0.6,1]);

set(gca,'YTickMode','manual','YTick',[0,Ripple,1]);grid

subplot(2,2,4); plot(w/pi,dbh); title('Highpass Filter Magnitude in dB');

xlabel('frequency in pi units'); ylabel('decibels'); axis([0 1 -30 0]);

set(gca,'XTickMode','manual','XTick',[0,0.6,1])

set(gca,'YTickMode','manual','YTick',[-30,-Rp,0]);grid

set(gca,'YTickLabelMode','manual','YTickLabels',['30';' 1';' 0']);

