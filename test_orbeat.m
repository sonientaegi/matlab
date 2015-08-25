clear;
Fcl     = 96;
Fc      = 128;
Fch     = 160;
Rp      = 1;
As      = 41;
Ts      = 0.050;    % 50ms 주기로샘플링

START = 59; 
STOP = 60;
[source, Fs] = audioreadcut('breathe.mp3', START, STOP);
wc = 2*pi*Fc/Fs;
Ns = ceil(Fs * Ts);
T = [START:1/Fs:STOP-1/Fs];

% 1차 소프트웨어 Capacitance 
out1 = lpf_iir(source, wc);
pow1 = zeros(1, length(out1));
index = 1;
while index < length(out1)-Ns
    Ex = 0;
    for k = [0:Ns-1]
        Ex = Ex + out1(index + k) .^ 2;
    end    
    Pavg = Ex / Ns;
    
    for k = [0:Ns-1]
        pow1(index + k) = Pavg;
    end
    index = index + Ns;
end

% Cheby Chef 
out2 = lpf_cheby(source, Fcl, Fch, Fs, Rp, As);
pow2 = zeros(1, length(out2));
index = 1;
while index < length(out2)-Ns
    Ex = 0;
    for k = [0:Ns-1]
        Ex = Ex + out2(index + k) .^ 2;
    end    
    Pavg = Ex / Ns;
    
    for k = [0:Ns-1]
        pow2(index + k) = Pavg;
    end
    index = index + Ns;
end

Freq = [0:Fs/length(source):Fs/2-(Fs/length(source))];
spectrum = fft(source);
spectrum = spectrum(1:length(spectrum)/2);

spec1    = fft(out1);
spec1    = spec1(1:length(spec1)/2);

spec2    = fft(out2);
spec2    = spec2(1:length(spec2)/2);

