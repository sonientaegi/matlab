% Chapter 05: Example 05.09: Circular symmetry property

%

subplot(1,1,1)

% a) plot x((-n))N

n = 0:10; x = 10*(0.8) .^ n;

y = x(mod(-n,11)+1);

subplot(2,1,1); stem(n,x); title('Original sequence')

xlabel('n'); ylabel('x(n)'); axis([-0.5,10.5,-1,11])

subplot(2,1,2); stem(n,y); title('Circularly folded sequence')

xlabel('n'); ylabel('x(-n mod 11)'); axis([-0.5,10.5,-1,11])

pause;

%print -deps2 me0509a.eps

%

% b) verify property

X = dft(x,11); Y = dft(y,11);

subplot(2,2,1); stem(n,real(X)); axis([-0.5,10.5,-5,50])

title('Real{DFT[x(n)]}'); xlabel('k');

subplot(2,2,2); stem(n,imag(X)); axis([-0.5,10.5,-20,20])

title('Imag{DFT[x(n)]}'); xlabel('k');

subplot(2,2,3); stem(n,real(Y)); axis([-0.5,10.5,-5,50])

title('Real{DFT[x((-n))11]}'); xlabel('k');

subplot(2,2,4); stem(n,imag(Y)); axis([-0.5,10.5,-20,20])

title('Imag{DFT[x((-n))11]}'); xlabel('k');

%print -deps2 me0509b.eps

