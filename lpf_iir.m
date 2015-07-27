function [ y ] = lpf_iir( x, wc, offset )
%UNTITLED2 이 함수의 요약 설명 위치
%   자세한 설명 위치
if (~exist('offset', 'var')) 
    offset = 0;
end

alpha   = 1 / ( 1 + wc );
y       = zeros(1, length(x));

y(1) = (1-alpha)*x(1) + offset;
for i = 2:length(x)    
    y(i) = alpha*y(i-1) + (1-alpha)*x(i); 
end

