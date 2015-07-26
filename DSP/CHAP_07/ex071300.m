% Chapter 07: Example 7.13 Hilbert Transformer design - Hanning window

%

M = 25; alpha = (M-1)/2;

n = 0:M-1;

hd = (2/pi)*((sin((pi/2)*(n-alpha)).^2)./(n-alpha)); hd(alpha+1)=0;

w_han = (hanning(M))';

h = hd .* w_han;

[Hr,w,P,L] = Hr_Type3(h);

% plots

subplot(1,1,1);

subplot(2,2,1); stem(n,hd); title('Ideal Impulse Response')

axis([-1 M -1.2 1.2]); xlabel('n'); ylabel('hd(n)')

subplot(2,2,2); stem(n,w_han);title('Hanning Window')

axis([-1 M 0 1.2]); xlabel('n'); ylabel('w(n)')

subplot(2,2,3); stem(n,h);title('Actual Impulse Response')

axis([-1 M -1.2 1.2]); xlabel('n'); ylabel('h(n)')

w = w'; Hr = Hr';

w = [-fliplr(w), w(2:501)]; Hr = [-fliplr(Hr), Hr(2:501)];

subplot(2,2,4);plot(w/pi,Hr); title('Amplitude Response');grid;

xlabel('frequency in pi units'); ylabel('Hr')

axis([-1 1 -1.1 1.1]); 

set(gca,'XTickMode','manual','XTick',[-1,0,1])

set(gca,'YTickMode','manual','YTick',[-1,0,1])