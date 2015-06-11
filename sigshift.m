function [ y, n ] = sigshift( x,m,k )
% y(n) = x(n-k)
% 단 x1 과 x2 의 길이는 서로 다를 수 있다.

n = m + k
y = x
end

