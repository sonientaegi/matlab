% Chapter 05: Example 05.12: Circular shift example

%

subplot(1,1,1)

% a) plot x((n-6))15

n = 0:10; x = 10*(0.8) .^ n;

y = cirshftt(x,6,15); 

n = 0:14; x = [x, zeros(1,4)];

subplot(2,1,1); stem(n,x); title('Original sequence')

xlabel('n'); ylabel('x(n)'); axis([-1,15,-1,11])

subplot(2,1,2); stem(n,y); 

title('Circularly shifted sequence, N=15')

xlabel('n'); ylabel('x((n-6) mod 15)'); 

axis([-1,15,-1,11])

pause; print -deps2 me0512.eps