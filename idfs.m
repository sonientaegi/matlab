function [ xn ] = idfs( Xk, N )
n = 0:N-1;
k = 0:N-1;
e = exp(j*2*pi/N*n'*k);
xn = Xk * e / N;
end

