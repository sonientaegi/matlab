function [ x ] = idtft( X, w, n )
syms nn;
dw = 2 * pi / length(w);
x = X * exp(j*w'*nn) * dw / ( 2*pi); 
nn = n;
x = eval(x);
end

