% Chapter 8: Example 8.29

%            Elliptic Bandpass Filter Design:

%                Use of the ELLIP function

%

% Digital Filter Specifications:        % Type: Elliptic Bandpass

ws = [0.3*pi 0.75*pi];                  % Dig. stopband edge frequency

wp = [0.4*pi 0.6*pi];                   % Dig. passband edge frequency

Rp = 1;	                                % Passband ripple in dB

As = 40;                                % Stopband attenuation in dB

Ripple = 10 ^ (-Rp/20);                 % Passband ripple

Attn = 10 ^ (-As/20);                   % Passband attenuation



% Calculations of Elliptic Filter Parameters:

[N,wn] = ellipord(wp/pi,ws/pi,Rp,As);



% Digital Elliptic Bandpass Filter Design:

[b,a] = ellip(N,Rp,As,wn);



% Cascade Form Realization:

[b0,B,A] = dir2cas(b,a)

%%b0 = 0.0197

%%B = 1.0000    1.5066    1.0000

%%    1.0000    0.9268    1.0000

%%    1.0000   -0.9268    1.0000

%%    1.0000   -1.5066    1.0000

%%A = 1.0000    0.5963    0.9399

%%    1.0000    0.2774    0.7929

%%    1.0000   -0.2774    0.7929

%%    1.0000   -0.5963    0.9399



% Plotting:

figure(1); subplot(1,1,1)

[db,mag,pha,grd,w] = freqz_m(b,a);

subplot(2,2,1);plot(w/pi,mag);grid;title('Magnitude Response')

xlabel('frequency in pi units'); axis([0, 1, 0, 1])

set(gca,'XTickMode','manual','XTick',[0;0.3;0.4;0.6;0.75;1])

set(gca,'YTickMode','manual','YTick',[0,Ripple,1]);

subplot(2,2,3);plot(w/pi,db);grid;title('Magnitude in dB')

xlabel('frequency in pi units'); axis([0 1 -50 0]);

set(gca,'XTickMode','manual','XTick',[0;0.3;0.4;0.6;0.75;1])

set(gca,'YTickMode','manual','YTick',[-40;0])

set(gca,'YTickLabelMode','manual','YTickLabels',['40';' 0'])

subplot(2,2,2);plot(w/pi,pha/pi);grid;title('Phase Response')

xlabel('frequency in pi units');ylabel('phase in pi units') 

set(gca,'XTickMode','manual','XTick',[0;0.3;0.4;0.6;0.75;1])

subplot(2,2,4);plot(w/pi,grd);grid;title('Group Delay')

xlabel('frequency in pi units'); ylabel('samples')

set(gca,'XTickMode','manual','XTick',[0;0.3;0.4;0.6;0.75;1])

