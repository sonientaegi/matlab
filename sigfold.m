function [ y,n ] = sigfold(x, n)
% Mirror x(n)
y = fliplr(x); n = -fliplr(n);
end