% Chapter 05: Example 05.05: Frequency-domain sampling

%

% x(n)=(0.7)^n * u(n)

% X(z)=z/(z-0.7); |z|>0.7

subplot(1,1,1)

%

N = 5;

k = 0:1:N-1;

wk = 2*pi*k/N;

zk = exp(j*wk);

Xk = (zk)./(zk-0.7);

xn = real(idfs(Xk,N));

xtilde = xn'* ones(1,8); xtilde = (xtilde(:))';

subplot(2,2,1); stem(0:39,xtilde);axis([0,40,-0.1,1.5])

xlabel('n'); ylabel('xtilde(n)'); title('N=5')

%

N = 10;

k = 0:1:N-1;

wk = 2*pi*k/N;

zk = exp(j*wk);

Xk = (zk)./(zk-0.7);

xn = real(idfs(Xk,N));

xtilde = xn'* ones(1,4); xtilde = (xtilde(:))';

subplot(2,2,2); stem(0:39,xtilde);axis([0,40,-0.1,1.5])

xlabel('n'); ylabel('xtilde(n)'); title('N=10')

%

N = 20;

k = 0:1:N-1;

wk = 2*pi*k/N;

zk = exp(j*wk);

Xk = (zk)./(zk-0.7);

xn = real(idfs(Xk,N));

xtilde = xn'* ones(1,2); xtilde = (xtilde(:))';

subplot(2,2,3); stem(0:39,xtilde);axis([0,40,-0.1,1.5])

xlabel('n'); ylabel('xtilde(n)'); title('N=20')

%

N = 40;

k = 0:1:N-1;

wk = 2*pi*k/N;

zk = exp(j*wk);

Xk = (zk)./(zk-0.7);

xn = real(idfs(Xk,N));

subplot(2,2,4); stem(0:39,xn);axis([0,40,-0.1,1.5])

xlabel('n'); ylabel('xtilde(n)'); title('N=40')

