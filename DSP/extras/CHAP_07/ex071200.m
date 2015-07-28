% Chapter 07: Example 7.12 Differentiator design - Hamming window

%

M = 21; alpha = (M-1)/2;

n = 0:M-1;

hd = (cos(pi*(n-alpha)))./(n-alpha); hd(alpha+1)=0;

w_ham = (hamming(M))';

h = hd .* w_ham;

[Hr,w,P,L] = Hr_Type3(h);

% plots

subplot(1,1,1);

subplot(2,2,1); stem(n,hd); title('Ideal Impulse Response')

axis([-1 M -1.2 1.2]); xlabel('n'); ylabel('hd(n)')

subplot(2,2,2); stem(n,w_ham);title('Hamming Window')

axis([-1 M 0 1.2]); xlabel('n'); ylabel('w(n)')

subplot(2,2,3); stem(n,h);title('Actual Impulse Response')

axis([-1 M -1.2 1.2]); xlabel('n'); ylabel('h(n)')

subplot(2,2,4);plot(w/pi,Hr/pi); title('Amplitude Response');grid;

xlabel('frequency in pi units'); ylabel('slope in pi units')

axis([0 1 0 1]); 

set(gca,'XTickMode','manual','XTick',[0,0.2,0.4,0.6,0.8,1])

set(gca,'YTickMode','manual','YTick',[0,0.2,0.4,0.6,0.8,1])