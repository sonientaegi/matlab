function [ y ] = hpf( src, Fc, Fs, M )
wc = pi*2*Fc/Fs;
h = ideal_lp(pi, M) - ideal_lp(wc, M);
w = hamming(M)';
hpf = w .* h;

y = conv(src, hpf);
end

