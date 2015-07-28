% Chapter 7: Example 7.17

%            Freq. Samp. Tech.: Bandpass, Optimum method T1 & T2

%            ws1=0.2pi, wp1=0.35pi, wp2=0.65pi, ws2=0.8pi, Rp=1dB, As=60dB

%            T2 = 0.59417456, T1=0.109021

M = 40; alpha = (M-1)/2; l = 0:M-1; wl = (2*pi/M)*l;

T1 = 0.109021; T2 = 0.59417456;

Hrs = [zeros(1,5),T1,T2,ones(1,7),T2,T1,zeros(1,9),T1,T2,ones(1,7),T2,T1,zeros(1,4)];

Hdr = [0,0,1,1,0,0]; wdl = [0,0.2,0.35,0.65,0.8,1];

k1 = 0:floor((M-1)/2); k2 = floor((M-1)/2)+1:M-1;

angH = [-alpha*(2*pi)/M*k1, alpha*(2*pi)/M*(M-k2)];

H = Hrs.*exp(j*angH);

h = real(ifft(H,M));

[db,mag,pha,grd,w] = freqz_m(h,1);

[Hr,ww,a,L] = Hr_Type2(h);

subplot(1,1,1)

subplot(2,2,1);plot(wl(1:21)/pi,Hrs(1:21),'o',wdl,Hdr); 

axis([0,1,-0.1,1.1]); title('Bandpass: M=40,T1=0.5941, T2=0.109')

xlabel('frequency in pi units'); ylabel('Hr(k)')

set(gca,'XTickMode','manual','XTick',[0,0.2,0.35,0.65,0.8,1])

set(gca,'YTickMode','manual','YTick',[0,0.59,0.109,1]); grid

subplot(2,2,2); stem(l,h); axis([-1,M,-0.4,0.4])

title('Impulse Response'); xlabel('n'); ylabel('h(n)');

subplot(2,2,3); plot(ww/pi,Hr,wl(1:21)/pi,Hrs(1:21),'o');

axis([0,1,-0.1,1.1]); title('Amplitude Response')

xlabel('frequency in pi units'); ylabel('Hr(w)')

set(gca,'XTickMode','manual','XTick',[0,0.2,0.35,0.65,0.8,1])

set(gca,'YTickMode','manual','YTick',[0,0.59,0.109,1]); grid

subplot(2,2,4);plot(w/pi,db); axis([0,1,-100,10]); grid

title('Magnitude Response'); xlabel('frequency in pi units');

ylabel('Decibels');

set(gca,'XTickMode','Manual','XTick',[0,0.2,0.35,0.65,0.8,1]);

set(gca,'YTickMode','Manual','YTick',[-60;0]);

set(gca,'YTickLabelMode','manual','YTickLabels',['60';' 0'])

%