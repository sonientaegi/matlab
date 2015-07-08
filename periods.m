function [ P, output ] = periods( data, Fs, Tp_max )
Fc_low  = 128;
Fc_high = 8192;
Mfilter = 101;

% 1. data 를 Fc_low - Fc_hi BandStop 필터를 통과시켜 베이스드럼과 스네어드럼을 추출한다.
wc_low  = 2*pi/Fs*Fc_low;
wc_high = 2*pi/Fs*Fc_high;
h       = ideal_lp(pi, Mfilter) - ideal_lp(wc_high, Mfilter) + ideal_lp(wc_low, Mfilter);
w       = blackman(Mfilter)';
bpf     = w .* h;

src     = conv(data, bpf);
src     = src((Mfilter+1)/2:(Mfilter-1)/2+length(data));

% 2. power 를 구한다.
pow     = src .* src;

% 3. power 를 windowing 하여 스무딩을한다.
%pow     = conv(pow, w);
%pow     = pow((Mfilter+1)/2:(Mfilter-1)/2+length(data));

% 4. 반복적으로 주기를 구한다.
P       = zeros(1, length(data));
i       = 1;
Mp_block=Tp_max*2*Fs;
while i <= (length(data)-Mp_block)
    Tp = period(pow(i:i+Mp_block-1), Fs);
    if Tp < 0.5 || Tp > Tp_max
        Tp = 0;
        Mp = ceil(0.1 * Fs);
    else
        Mp = ceil(Tp * Fs / 2);
    end
    P(i:i+Mp-1) = Tp;
    i = i + Mp;
end
output = pow;
end

