function [ x ] = idft( Xk )
syms n;
N = length(Xk);
k = 0:N-1;
x(n) = Xk * exp(j*2*pi/N*k'*n) / N;
n = k;
x = x(n);
end

