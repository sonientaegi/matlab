function [ Xk ] = dft( x )
syms k;
N = length(x);
n = 0:N-1;
X(k) = x * exp(-j*2*pi/N*n'*k);
k = n;
Xk = X(k);
end

