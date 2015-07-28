% Chapter 7: Example 7.18

%            Freq. Samp. Tech.: Highpass, Optimum method T1

%            ws=0.6pi, wp=0.8pi, Rp=1dB, As=50dB

%            M=33, T1 = 0.1095; T2 = 0.598;

M = 33; alpha = (M-1)/2; l = 0:M-1; wl = (2*pi/M)*l;

T1 = 0.1095; T2 = 0.598;

Hrs = [zeros(1,11),T1,T2,ones(1,8),T2,T1,zeros(1,10)];

Hdr = [0,0,1,1]; wdl = [0,0.6,0.8,1];

k1 = 0:floor((M-1)/2); k2 = floor((M-1)/2)+1:M-1;

angH = [-alpha*(2*pi)/M*k1, alpha*(2*pi)/M*(M-k2)];

H = Hrs.*exp(j*angH);

h = real(ifft(H,M));

[db,mag,pha,grd,w] = freqz_m(h,1);

[Hr,ww,a,L] = Hr_Type1(h);

subplot(1,1,1)

subplot(2,2,1);plot(wl(1:17)/pi,Hrs(1:17),'o',wdl,Hdr); 

axis([0,1,-0.1,1.1]); title('Highpass: M=33,T1=0.1095,T2=0.598')

xlabel('frequency in pi units'); ylabel('Hr(k)')

set(gca,'XTickMode','manual','XTick',[0;.6;.8;1])

set(gca,'XTickLabelMode','manual','XTickLabels',[' 0';'.6';'.8';' 1'])

set(gca,'YTickMode','manual','YTick',[0,0.109,0.59,1]); grid

subplot(2,2,2); stem(l,h); axis([-1,M,-0.4,0.4])

title('Impulse Response'); xlabel('n'); ylabel('h(n)');

subplot(2,2,3); plot(ww/pi,Hr,wl(1:17)/pi,Hrs(1:17),'o');

axis([0,1,-0.1,1.1]); title('Amplitude Response')

xlabel('frequency in pi units'); ylabel('Hr(w)')

set(gca,'XTickMode','manual','XTick',[0;.6;.8;1])

set(gca,'XTickLabelMode','manual','XTickLabels',[' 0';'.6';'.8';' 1'])

set(gca,'YTickMode','manual','YTick',[0,0.109,0.59,1]); grid

subplot(2,2,4);plot(w/pi,db); axis([0,1,-100,10]); grid

title('Magnitude Response'); xlabel('frequency in pi units');

ylabel('Decibels');

set(gca,'XTickMode','manual','XTick',[0;.6;.8;1])

set(gca,'XTickLabelMode','manual','XTickLabels',[' 0';'.6';'.8';' 1'])

set(gca,'YTickMode','Manual','YTick',[-50;0]);

set(gca,'YTickLabelMode','manual','YTickLabels',['50';' 0'])

%