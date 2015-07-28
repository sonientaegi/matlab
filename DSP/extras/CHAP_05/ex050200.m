% Chapter 5: Example 5.02

%

L = 5; N = 20;

x = [ones(1,L), zeros(1,N-L)];

xn = x' * ones(1,3);

xn = (xn(:))';

n = -N:1:2*N-1;

subplot(1,1,1);subplot(2,1,2);

stem(n,xn); xlabel('n'); ylabel('xtilde(n)')

title('Three periods of xtilde(n)')

axis([-N,2*N-1,-0.5,1.5])

%print -deps2 fg0502.eps

%

subplot(1,1,1)

% Part (b)1

L = 5; N = 20;

xn = [ones(1,L), zeros(1,N-L)];

Xk = dfs(xn,N);

magXk = abs([Xk(N/2+1:N) Xk(1:N/2+1)]);

k = [-N/2:N/2];

subplot(2,2,1); stem(k,magXk); axis([-N/2,N/2,-0.5,5.5])

xlabel('k'); ylabel('Xtilde(k)')

title('DFS of SQ. wave: L=5, N=20')

% Part (b)2

L = 5; N = 40;

xn = [ones(1,L), zeros(1,N-L)];

Xk = dfs(xn,N);

magXk = abs([Xk(N/2+1:N) Xk(1:N/2+1)]);

k = [-N/2:N/2];

subplot(2,2,2); stem(k,magXk); axis([-N/2,N/2,-0.5,5.5])

xlabel('k'); ylabel('Xtilde(k)')

title('DFS of SQ. wave: L=5, N=40')

% Part (b)3

L = 5; N = 60;

xn = [ones(1,L), zeros(1,N-L)];

Xk = dfs(xn,N);

magXk = abs([Xk(N/2+1:N) Xk(1:N/2+1)]);

k = [-N/2:N/2];

subplot(2,2,3); stem(k,magXk); axis([-N/2,N/2,-0.5,5.5])

xlabel('k'); ylabel('Xtilde(k)')

title('DFS of SQ. wave: L=5, N=60')

% Part (b)4

L = 7; N = 60;

xn = [ones(1,L), zeros(1,N-L)];

Xk = dfs(xn,N);

magXk = abs([Xk(N/2+1:N) Xk(1:N/2+1)]);

k = [-N/2:N/2];

subplot(2,2,4); stem(k,magXk); axis([-N/2,N/2,-0.5,7.5])

xlabel('k'); ylabel('Xtilde(k)')

title('DFS of SQ. wave: L=7, N=60')

%print -deps2 fg0502b.eps