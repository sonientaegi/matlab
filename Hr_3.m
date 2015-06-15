function [ Hr, w, c, L ] = Hr_3( h )
% Hr = Amplitude Response
%  w = 0 ~ pi, 500 samples
%  c = LPF coefficients
%  L = Order of Hr
%  h = Impluse response

M   = length(h); L = (M-1)/2;
c   = 2*h(L+1:-1:1);
n   = 0:L;
w   = [0:500]'*pi/500;
Hr  = sin(w*n)*c';
end

