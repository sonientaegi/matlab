% Chapter 4: Example 4.4:

%  X(z) using ztrans

%   x(n) = (n-2)(0.5)^(n-2)cos[pi*(n-2)/3]u(n-2)

x = 'n*((0.5)^n)*cos(pi*n/3)';

X = ztrans(x);

[nX,dX] = numden(X);

expand(nX), expand(dX);

dX = symmul(dX,'z^2'); expand(dX)

