function [ y ] = bpf( src, FcLow, FcHigh, Fs, M )
if mod(M,2) ~= 1
    error('M 은 반드시 홀수여야 합니다.')
end

hh = ideal_lp(pi*2*FcHigh/Fs, M);
hl = ideal_lp(pi*2*FcLow/Fs, M);
h = hh - hl;
w = hamming(M)';
bpf = h.*w;
y = conv(src, bpf);
end

