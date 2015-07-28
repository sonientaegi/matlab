% Chapter 05: Example 05.08: HiRes Spectrum

%

% High resolution spectrum based on 100 samples of the signal x(n)

subplot(1,1,1)

n=[0:1:99];

x=cos(0.48*pi*n)+cos(0.52*pi*n);

subplot(2,1,1);stem(n,x);title('signal x(n), 0 <= n <= 99');xlabel('n')

axis([0,100,-2.5,2.5])

X=fft(x);magX=abs(X(1:1:51));

k=0:1:50;w=2*pi/100*k;

subplot(2,1,2);plot(w/pi,magX);title('DTFT Magnitude');xlabel('frequency in pi units')

axis([0,1,0,60])

disp('Press RETURN to continue');pause;

%print -deps2 me0508c.eps; subplot

%

% Spectrum based on the first 10 samples of x(n)

n1=[0:1:9];y1=x(1:1:10);

subplot(2,1,1);stem(n1,y1);title('signal x(n), 0 <= n <= 9');xlabel('n')

axis([0,10,-2.5,2.5])

Y1=fft(y1);magY1=abs(Y1(1:1:6));

k1=0:1:5;w1=2*pi/10*k1;

subplot(2,1,2);stem(w1/pi,magY1);title('Samples of DTFT Magnitude');

xlabel('frequency in pi units')

axis([0,1,0,10])

disp('Press RETURN to continue');pause;

print -deps2 me0508a.eps; subplot

%

% high density Spectrum (50 samples) based on the first 10 samples of x(n)

n2=[0:1:49];y2=[x(1:1:10) zeros(1,40)];

subplot(2,1,1);stem(n2,y2);title('signal x(n), 0 <= n <= 9 + 40 zeros');xlabel('n')

axis([0,50,-2.5,2.5])

Y2=fft(y2);magY2=abs(Y2(1:1:26));

k2=0:1:25;w2=2*pi/50*k2;

subplot(2,1,2);plot(w2/pi,magY2);title('DTFT Magnitude');xlabel('frequency in pi units')

axis([0,1,0,10])

disp('Press RETURN to continue');pause; subplot

%

% High density spectrum (100 samples) based on the first 10 samples of x(n)

n3=[0:1:99];y3=[x(1:1:10) zeros(1,90)];

subplot(2,1,1);stem(n3,y3);title('signal x(n), 0 <= n <= 9 + 90 zeros');xlabel('n')

axis([0,100,-2.5,2.5])

Y3=fft(y3);magY3=abs(Y3(1:1:51));

k3=0:1:50;w3=2*pi/100*k3;

subplot(2,1,2);plot(w3/pi,magY3);title('DTFT Magnitude');xlabel('frequency in pi units')

axis([0,1,0,10])

disp('Press RETURN to continue');pause;

%print -deps2 me0508b.eps; subplot



