function [ y ] = lpf( src, Fc, Fs, M )
wc = 2*pi / Fs * Fc;
h = ideal_lp(wc, M);
w = blackman(M)';
lpf = w .* h;

y = conv(src, lpf);
end

