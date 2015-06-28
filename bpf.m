function [ y ] = bpf( src, FcLow, FcHigh, Fs, M )
if mod(M,2) ~= 1
    error('M 은 반드시 홀수여야 합니다.')
end

Fm = (FcHigh + FcLow) / 2;
bandwidth = FcHigh - FcLow;
wc = 2*pi / Fs * bandwidth / 2;
wm = round(Fm / (Fs/2) * (M-1) / 2);
hi = ones(1, M);
hi((M-1)/2 + wm) = 1;
hi((M-1)/2 - wm) = 1;
h = ideal_lp(wc, M);
h = circonvt(hi, h, M);

w = hamming(M)';
bpf = w .* h;

BPF = dft(bpf);
stem(0:100, abs(BPF));

y = conv(src, bpf);
end

