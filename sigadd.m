function [ y,n ] = sigadd( x1,n1,x2,n2 )
% x(n) = x1(n) + x2(n)
% 단 x1 과 x2 의 길이는 서로 다를 수 있다.
n = min(min(n1), min(n2)) : max(max(n1), max(n2));
y1 = zeros(1, length(n)); 
y2 = y1;
y1(find((n >= min(n1)) & (n <= max(n1)) == 1))=x1;
y2(find((n >= min(n2)) & (n <= max(n2)) == 1))=x2;
y = y1 + y2;
end

