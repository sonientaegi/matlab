% Chapter 05: Example 05.10: Circular even/odd property

%

subplot(1,1,1)

% a) plot xec(n) and xoc(n)

n = 0:10; x = 10*(0.8) .^ n;

[xec,xoc] = circevod(x);

subplot(2,1,1); stem(n,xec); title('Circular-even component')

xlabel('n'); ylabel('xec(n)'); axis([-0.5,10.5,-1,11])

subplot(2,1,2); stem(n,xoc); title('Circular-odd component')

xlabel('n'); ylabel('xoc(n)'); axis([-0.5,10.5,-4,4])

pause;

print -deps2 me0510a.eps

%

% b) verify property

X = dft(x,11); Xec = dft(xec,11); Xoc = dft(xoc,11);

subplot(2,2,1); stem(n,real(X)); axis([-0.5,10.5,-5,50])

title('Real{DFT[x(n)]}'); xlabel('k');

subplot(2,2,2); stem(n,imag(X)); axis([-0.5,10.5,-20,20])

title('Imag{DFT[x(n)]}'); xlabel('k');

subplot(2,2,3); stem(n,real(Xec)); axis([-0.5,10.5,-5,50])

title('DFT[xec(n)]'); xlabel('k');

subplot(2,2,4); stem(n,imag(Xoc)); axis([-0.5,10.5,-20,20])

title('DFT[xoc(n)]'); xlabel('k');

print -deps2 me0510b.eps

