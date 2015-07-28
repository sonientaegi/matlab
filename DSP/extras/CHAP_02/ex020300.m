% Chapter 02: Example 02.03: Signal Synthesis of complex sequence

%

figure(1); clf

% a) x(n) = exp((-0.1+j0.3)n), -10 <= n <= 10;

n = [-10:1:10]; alpha = -0.1+0.3j;

x = exp(alpha*n);

subplot(2,2,1); stem(n,real(x));title('real part');xlabel('n')

subplot(2,2,2); stem(n,imag(x));title('imaginary part');xlabel('n')

subplot(2,2,3); stem(n,abs(x));title('magnitude part');xlabel('n')

subplot(2,2,4); stem(n,(180/pi)*angle(x));title('phase part');xlabel('n')

