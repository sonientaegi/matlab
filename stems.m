function [ output_args ] = stems( x, y )
clf;
y = eval(y);
N = size(y);
N = N(1);
for n = 1:N
    subplot(N,1,n); stem(x, y(n, :));
end
end

