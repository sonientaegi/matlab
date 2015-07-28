% Chapter 05: Example 05.11: Circular shift graphical display

%

subplot(1,1,1)

% a) plot x((n+4))11

n = 0:10; x = 10*(0.8) .^ n;

n1 = -11:21; x1 = [zeros(1,11), x, zeros(1,11)];

subplot(2,2,1); stem(n1,x1); title('Original x(n)')

xlabel('n'); axis([-6,17,-1,11])

x2 = [x, x, x];

subplot(2,2,3); stem(n1,x2); title('Periodic extention')

xlabel('n'); axis([-6,17,-1,11])

x3 = [x2(4+1:33), x(1:4)];

subplot(2,2,2); stem(n1,x3); title('Periodic shift')

xlabel('n'); axis([-6,17,-1,11])

x4 = x3 .* [zeros(1,11), ones(1,11), zeros(1,11)];

subplot(2,2,4); stem(n1,x4); title('Circular shift')

xlabel('n'); axis([-6,17,-1,11])

pause;

%print -deps2 me0511a.eps

%

% b) plot x((n-3))15

n = 0:10; x = [10*(0.8) .^ n zeros(1,4)];

n1 = -15:29; x1 = [zeros(1,15), x, zeros(1,15)];

subplot(2,2,1); stem(n1,x1); title('Original x(n)')

xlabel('n'); axis([-9,25,-1,11])

x2 = [x, x, x];

subplot(2,2,3); stem(n1,x2); title('Periodic extention')

xlabel('n'); axis([-9,25,-1,11])

x3 = [x2(43:45),x2(1:42)];

subplot(2,2,2); stem(n1,x3); title('Periodic shift')

xlabel('n'); axis([-9,25,-1,11])

x4 = x3 .* [zeros(1,15), ones(1,15), zeros(1,15)];

subplot(2,2,4); stem(n1,x4); title('Circular shift')

xlabel('n'); axis([-9,25,-1,11])

pause;

%print -deps2 me0511b.eps

%

