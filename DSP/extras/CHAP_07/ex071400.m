% Chapter 7: Example 7.14

%            Freq. Samp. Tech.: Lowpass,Naive method

%

M = 20; alpha = (M-1)/2; l = 0:M-1; wl = (2*pi/M)*l;

Hrs = [1,1,1,zeros(1,15),1,1];

Hdr = [1,1,0,0]; wdl = [0,0.25,0.25,1];

k1 = 0:floor((M-1)/2); k2 = floor((M-1)/2)+1:M-1;

angH = [-alpha*(2*pi)/M*k1, alpha*(2*pi)/M*(M-k2)];

H = Hrs.*exp(j*angH);

h = real(ifft(H,M));

[db,mag,pha,grd,w] = freqz_m(h,1);

[Hr,ww,a,L] = Hr_Type2(h);

subplot(1,1,1)

subplot(2,2,1);plot(wl(1:11)/pi,Hrs(1:11),'o',wdl,Hdr); 

axis([0,1,-0.1,1.1]); title('Frequency Samples: M=20')

xlabel('frequency in pi units'); ylabel('Hr(k)')

set(gca,'XTickMode','manual','XTick',[0,0.2,0.3,1])

set(gca,'YTickMode','manual','YTick',[0,1]); grid

subplot(2,2,2); stem(l,h); axis([-1,M,-0.1,0.3])

title('Impulse Response'); xlabel('n'); ylabel('h(n)');

subplot(2,2,3); plot(ww/pi,Hr,wl(1:11)/pi,Hrs(1:11),'o');

axis([0,1,-0.2,1.2]); title('Amplitude Response')

xlabel('frequency in pi units'); ylabel('Hr(w)')

set(gca,'XTickMode','manual','XTick',[0,0.2,0.3,1])

set(gca,'YTickMode','manual','YTick',[0,1]); grid

subplot(2,2,4);plot(w/pi,db); axis([0,1,-60,10]); grid

title('Magnitude Response'); xlabel('frequency in pi units');

ylabel('Decibels');

set(gca,'XTickMode','Manual','XTick',[0;0.2;0.3;1]);

set(gca,'YTickMode','Manual','YTick',[-16;0]);

set(gca,'YTickLabelMode','manual','YTickLabels',['16';' 0'])

%