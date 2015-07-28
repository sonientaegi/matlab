% Chapter 05: Example 05.08

%             High density vs HiRes Spectrum

%

% signal x(n)

subplot(1,1,1);

n = [0:1:99]; x = cos(0.48*pi*n)+cos(0.52*pi*n);

%

% Spectrum based on the first 10 samples of x(n)

n1 = [0:1:9]; y1 = x(1:1:10);

subplot(2,3,1); stem(n1,y1);

title('x(n), 0 <= n <= 9');xlabel('n');

axis([0,10,-2.5,2.5]); set(gca,'fontsize',10)

Y1 = fft(y1); magY1 = abs(Y1(1:1:6));

k1 = 0:1:5; w1 = 2*pi/10*k1;

subplot(2,3,4);stem(w1/pi,magY1);title('Samples of DTFT Magnitude');

xlabel('frequency in pi units'); axis([0,1,0,10]); set(gca,'fontsize',10)

%

% High density spectrum (100 samples) based on the first 10 samples of x(n)

n2= [0:1:99]; y2 = [x(1:1:10) zeros(1,90)];

subplot(2,3,2); stem(n2,y2); title('x(n), 0 <= n <= 9 + 90 zeros'); xlabel('n')

axis([0,100,-2.5,2.5]); set(gca,'fontsize',10)

Y2 = fft(y2);magY2=abs(Y2(1:1:51));

k2 = 0:1:50; w2 = 2*pi/100*k2;

subplot(2,3,5); plot(w2/pi,magY2); title('DTFT Magnitude'); xlabel('frequency in pi units')

axis([0,1,0,10]); set(gca,'fontsize',10)

%

% High resolution spectrum based on 100 samples of the signal x(n)

subplot(2,3,3); stem(n,x); title('x(n), 0 <= n <= 99');xlabel('n')

axis([0,100,-2.5,2.5]); set(gca,'fontsize',10)

X = fft(x); magX=abs(X(1:1:51));

k = 0:1:50; w = 2*pi/100*k;

subplot(2,3,6);plot(w/pi,magX);title('DTFT Magnitude');xlabel('frequency in pi units')

axis([0,1,0,60]); set(gca,'fontsize',10)

