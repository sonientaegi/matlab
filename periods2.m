function [ T, pow, Traw ] = periods2( data, Fs, Tp_max )
Fc_low  = 128;
Fc_high = 10000;
Mfilter = 1001;

% 1. data 를 Fc_low - Fc_hi BandStop 필터를 통과시켜 베이스드럼과 스네어드럼을 추출한다.
wc_low  = 2*pi/Fs*Fc_low;
wc_high = 2*pi/Fs*Fc_high;
hhp     = ideal_lp(pi, Mfilter) - ideal_lp(wc_high, Mfilter);
hlp     = ideal_lp(wc_low, Mfilter);
hbp     = hlp + hhp;
w       = blackman(Mfilter)';
hpf     = w .* hhp;
lpf     = w .* hlp;
bpf     = w .* hbp;

% src     = conv(data, hpf);
% src     = conv(data, bpf);
src     = conv(data, bpf);
src     = src((Mfilter+1)/2:(Mfilter-1)/2+length(data));

% 2. power 를 구한다.
pow     = src .* src;

% 3. 반복적으로 주기를 구한다.
T       = zeros(1, length(data));
i       = 1;
ip      = 1;
Mp_block=Tp_max*2*Fs;
while i <= (length(data)-Mp_block)
    %{
    [Tp, graph] = period(pow(i:i+Mp_block-1), Fs);
    Ps(ip, :) = {i Tp graph};
    ip = ip + 1;
    if Tp < 0.5 || Tp > Tp_max
        % Tp = 0;
        Mp = ceil(0.1 * Fs);
    else
        Mp = Tp * Fs; %ceil(Tp * Fs / 2);
    end
    T(i:i+Mp-1) = Tp;
    i = i + Mp;
    %}
end

