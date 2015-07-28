% Chapter 8: Example 8.28

%            Chebyshev-1 Highpass Filter Design:

%                Use of the CHEBY1 function

%

% Digital Filter Specifications:        % Type: Chebyshev-I highpass

ws = 0.4586*pi;                         % Dig. stopband edge frequency

wp = 0.6*pi;                            % Dig. passband edge frequency

Rp = 1;                                 % Passband ripple in dB

As = 15;                                % Stopband attenuation in dB

Ripple = 10 ^ (-Rp/20);                 % Passband ripple

Attn = 10 ^ (-As/20);                   % Passband attenuation



% Calculations of Chebyshev-I Filter Parameters:

[N,wn] = cheb1ord(wp/pi,ws/pi,Rp,As);



% Digital Chebyshev-I Highpass Filter Design:

[b,a] = cheby1(N,Rp,wn,'high');



% Cascade Form Realization:

[b0,B,A] = dir2cas(b,a)

%%b0 = 0.0243

%%B = 1.0000   -1.9991    0.9991

%%    1.0000   -2.0009    1.0009

%%A = 1.0000    1.0416    0.4019

%%    1.0000    0.5561    0.7647



% Plotting:

figure(1); subplot(1,1,1)

[db,mag,pha,grd,w] = freqz_m(b,a);

subplot(2,2,1);plot(w/pi,mag);grid;title('Magnitude Response')

xlabel('Digital frequency in pi units'); axis([0,1,0,1])

set(gca,'XTickMode','manual','XTick',[0;ws/pi;wp/pi;1])

set(gca,'XTickLabelMode','manual','XTickLabels',['  0 ';'0.46';'0.6 ';'  1 '])

set(gca,'YTickMode','manual','YTick',[0;Attn;Ripple;1])

subplot(2,2,3);plot(w/pi,db);grid;title('Magnitude in dB')

xlabel('frequency in pi units'); axis([0,1,-30, 0]);

ylabel('decibels')

set(gca,'XTickMode','manual','XTick',[0;ws/pi;wp/pi;1])

set(gca,'XTickLabelMode','manual','XTickLabels',['  0 ';'0.46';'0.6 ';'  1 '])

set(gca,'YTickMode','manual','YTick',[-30;-As;-Rp;0])

set(gca,'YTickLabelMode','manual','YTickLabels',['30';'15';' 1';' 0'])

subplot(2,2,2);plot(w/pi,pha/pi);grid;title('Phase Response')

xlabel('frequency in pi units');ylabel('phase in pi units'); axis([0,1,-1,1])

set(gca,'XTickMode','manual','XTick',[0;ws/pi;wp/pi;1])

set(gca,'XTickLabelMode','manual','XTickLabels',['  0 ';'0.46';'0.6 ';'  1 '])

subplot(2,2,4);plot(w/pi,grd);grid;title('Group Delay')

xlabel('frequency in pi units');

ylabel('delay in samples')

set(gca,'XTickMode','manual','XTick',[0;ws/pi;wp/pi;1])

set(gca,'XTickLabelMode','manual','XTickLabels',['  0 ';'0.46';'0.6 ';'  1 '])

