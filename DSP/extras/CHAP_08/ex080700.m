% Chapter 8: Example 8.7

%            Chebyshev-2 Lowpass Analog filter design

%

Wp = 0.2*pi; Ws = 0.3*pi; Rp = 1; As = 16;

Ripple = 10 ^ (-Rp/20); Attn = 10 ^ (-As/20);



% Analog filter design:

[b,a] = afd_chb2(Wp,Ws,Rp,As);

%%*** Chebyshev-2 Filter Order =  4 



% Calculation of second-order sections:

[C,B,A] = sdir2cas(b,a)

%%C = 0.1585

%%B = 1.0000         0    6.0654

%%    1.0000         0    1.0407

%%A = 1.0000    1.9521    1.4747

%%    1.0000    0.3719    0.6784



% Calculation of Frequency Response:

[db,mag,pha,w] = freqs_m(b,a,0.5*pi);



% Calculation of Impulse response:

[ha,x,t] = impulse(b,a);



% Plots

figure(1); subplot(1,1,1)

subplot(2,2,1); plot(w/pi,mag);title('Magnitude Response')

xlabel('Analog frequency in pi units'); ylabel('|H|'); axis([0,0.5,0,1.1])

set(gca,'XTickMode','manual','XTick',[0,0.2,0.3,0.5]);

set(gca,'YTickmode','manual','YTick',[0,Attn,Ripple,1]); grid

subplot(2,2,2); plot(w/pi,db);title('Magnitude in dB')

xlabel('Analog frequency in pi units'); ylabel('decibels'); axis([0,0.5,-30,5])

set(gca,'XTickMode','manual','XTick',[0,0.2,0.3,0.5]);

set(gca,'YTickmode','manual','YTick',[-30,-As,-Rp,0]); grid

set(gca,'YTickLabelMode','manual','YTickLabels',['30';'16';' 1';' 0'])

subplot(2,2,3); plot(w/pi,pha/pi); title('Phase Response')

xlabel('Analog frequency in pi units'); ylabel('radians'); axis([0,0.5,-1,1])

set(gca,'XTickMode','manual','XTick',[0,0.2,0.3,0.5]);

set(gca,'YTickmode','manual','YTick',[-1,-0.5,0,0.5,1]); grid

subplot(2,2,4); plot(t,ha,[0,max(t)],[0,0]); title('Impulse Response')

xlabel('time in seconds'); ylabel('ha(t)'); axis([0,max(t),min(ha),max(ha)])