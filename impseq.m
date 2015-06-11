function [ x,n ] = impseq( n0, n1, n2 )
% x(n) = delta(n-n0); n1 <= n0 <= n2 
n = [n1:n2];
x = [(n-n0) == 0];
end


