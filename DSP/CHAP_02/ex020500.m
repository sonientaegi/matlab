% Example 2.5

%

% x(n)=[u(n)=u(n-10]; h(n)=(0.9)^n*u(n)

% y(n)=10*(1-(0.9)^(n+1))*(u(n)-u(n-10))+

%       (10*(1-(0.9)^10)*(0.9)^(n-9))*u(n-10)

n = -5:50;

u1 = stepseq(0,-5,50); u2=stepseq(10,-5,50);

% input x(n)

x = u1-u2;

% impulse response h(n)

h = ((0.9).^n).*u1;

subplot(1,1,1)

subplot(2,1,1); stem(n,x); axis([-5,50,0,2])

title('Input Sequence')

xlabel('n'), ylabel('x(n)')

subplot(2,1,2); stem(n,h); axis([-5,50,0,2])

title('Impulse Response')

xlabel('n'), ylabel('h(n)'); pause

print -deps2 ex0205a.eps

% output response

y = (10*(1-(0.9).^(n+1))).*(u1-u2)+(10*(1-(0.9)^10)*(0.9).^(n-9)).*u2;

subplot(1,1,1)

subplot(2,1,2); stem(n,y); axis([-5,50,0,8])

title('Output Sequence')

xlabel('n'), ylabel('y(n)')

print -deps2 ex0205b.eps

