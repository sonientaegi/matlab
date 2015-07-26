% Analog Signal

Dt = 0.00005;

t = -0.005:Dt:0.005;

xa = exp(-1000*abs(t));

% Discrete-time Signal

Ts = 0.0002; n = -25:1:25;

x = exp(-1000*abs(n*Ts));

% Discrete-time Fourier transform

K = 500; k = 0:1:K;

w = pi*k/K;

X = x * exp(-j*n'*w);

X = real(X);

w = [-fliplr(w), w(2:K+1)];

X = [fliplr(X), X(2:K+1)];

subplot(1,1,1)

subplot(2,1,1);plot(t*1000,xa);

xlabel('t in msec.'); ylabel('x1(n)')

title('Discrete Signal'); hold on

stem(n*Ts*1000,x); gtext('Ts=0.2 msec'); hold off

subplot(2,1,2);plot(w/pi,X);

xlabel('Frequency in pi units'); ylabel('X1(w)')

title('Discrete-time Fourier Transform')



