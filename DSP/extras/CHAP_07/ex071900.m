% Chapter 7: Example 7.19

%            Freq. Samp. Tech.: Differentiator

%

M = 33; alpha = (M-1)/2; Dw = 2*pi/M;

l = 0:M-1; wl = Dw*l;

k1 = 0:floor((M-1)/2); k2 = floor((M-1)/2)+1:M-1;

Hrs = [j*Dw*k1,-j*Dw*(M-k2)];

angH = [-alpha*Dw*k1, alpha*Dw*(M-k2)];

H = Hrs.*exp(j*angH);

h = real(ifft(H,M));

[Hr,ww,a,P]=Hr_Type3(h);

%

% plots

subplot(1,1,1)

subplot(2,1,1); k = 1:(M+1)/2;

plot(ww/pi,+Hr/pi,wl(k)/pi,abs(Hrs(k))/pi,'o',wl(k)/pi,wl(k)/pi);

title('Differentiator, frequency sampling design : M = 33');

xlabel('frequency in pi units'); ylabel('Hr in pi units');

subplot(2,1,2); stem(l,h); axis([-1,M,-1.1,1.1]);

title('Impulse response'); xlabel('n'); ylabel('h(n)');

set(gca,'XTickMode','manual','XTick',[0;alpha;M-1])

