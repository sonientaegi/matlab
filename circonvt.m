function [ y ] = circonvt( x, h, N )
xa = zeros(1, N); xa(1:length(x)) = x(1:length(x));
ha = zeros(1, N); ha(1:length(h)) = h(1:length(h));

for n = 0:N-1;
    y(n+1) = xa * [ ha(mod(n-[0:N-1], N) + 1) ]';
end
end

