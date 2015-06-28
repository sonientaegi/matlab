function [ y ] = hpf( src, Fc, Fs, M )
wc = 2*pi / Fs * Fc;
h = ideal_lp(wc, M);
H = dft(h);
h = idft(1-H);
stem(1:M, abs(H));
w = hamming(M)';
hpf = w .* h;

y = conv(src, hpf);
end

