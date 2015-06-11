function [ X ] = dtft( x, n, w )
syms W;
X = x * exp(-j*W*n');
W = w;
X = eval(X);
end

