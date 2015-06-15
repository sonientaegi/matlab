function [ Hr, w, d, L ] = Hr_4( h )
% Hr = Amplitude Response
%  w = 0 ~ pi, 500 samples
%  d = LPF coefficients
%  L = Order of Hr
%  h = Impluse response

M   = length(h); L = M/2;
d   = 2*h(L:-1:1);
n   = [1:L]-0.5;
w   = [0:500]'*pi/500;
Hr  = cos(w*n)*d';
end

