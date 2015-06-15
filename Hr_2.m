function [ Hr, w, b, L ] = Hr_2( h )
% Hr = Amplitude Response
%  w = 0 ~ pi, 500 samples
%  b = LPF coefficients
%  L = Order of Hr
%  h = Impluse response

M   = length(h); L = M/2;
b   = 2*h(L:-1:1);
n   = [1:L]-0.5;
w   = [0:500]'*pi/500;
Hr  = cos(w*n)*b';
end

