function [ Hr, w, a, L ] = Hr_1( h )
% Hr = Amplitude Response
%  w = 0 ~ pi, 500 samples
%  a = LPF coefficients
%  L = Order of Hr
%  h = Impluse response

M   = length(h); L = (M-1)/2;
a   = [h(L+1) 2*h(L:-1:1)];
n   = 0:L;
w   = [0:500]'*pi/500;
Hr  = cos(w*n)*a';
end

