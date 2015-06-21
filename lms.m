function [ h, y ] = lms( x, d, delta, N )
%     h = 추정된 FIR filter
%     y = 출력
%     x = 입력
%     d = 대조군. x 와동일한크기
% delta = Step size
%     N = FIR 필터 계수 갯수
M = length(x); 
y = zeros(1, M);
e = zeros(1, M); 
h = zeros(1, N);

for n = N:M
       x1 = x(n:-1:n-N+1);
       yt = h * x1';
     y(n) = yt;
       et = d(n) - yt;
     e(n) = et;
        h = h + delta*et*x1;
end
end

