% Example 2.11

%

% x(n) = u(n)-u(n-10)

% h(n) = (0.9)^n * u(n)

% diff eqn: y(n) - 0.9y(n-1) = x(n)

%

b = [1]; a = [1,-0.9];

n = -5:50; x = stepseq(0,-5,50) - stepseq(10,-5,50);

y = filter(b,a,x);

subplot(1,1,1);

subplot(2,1,2); stem(n,y); title('Output sequence')

xlabel('n'); ylabel('y(n)'); axis([-5,50,-0.5,8])



