function [ Xk ] = dfs( xn, N )
n = 0:N-1;
k = 0:N-1;
e = exp(-j*2*pi/N*n'*k);
Xk = xn * e;
end

