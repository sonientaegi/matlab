[src, Fs] = audioreadcut('music/cat.mp3', 0, -1);
src = src(1, :);
src = lpf(src, 256, Fs, 1001);
Ts = 5;
Tperiod = zeros(2, ceil(length(src)/Fs/Ts));

% Signal 로 주기 분석
index = 1;
for i = 1:Fs*Ts:length(src)-Fs*Ts
    Tperiod(1, index) = period(src(i:i+Fs*Ts-1), Fs);
    index = index + 1;
end

% Power 로 주기 분석
pow = src .* src;

Tps = 0.1;
Fps = 1/Tps;
powSample = zeros(1, ceil(length(src) / (Fs*Tps)));
index = 1;
for i = 1:Fs*Tps:length(src)-Fs*Tps
    powSample(index) = sum(pow(i:i+Fs*Tps-1));
    index = index+1;
end

index = 1;
for i = 1:Fps*Ts:length(powSample)-Fps*Ts
    Tperiod(2, index) = period(powSample(i:i+Fps*Ts-1), Fps);
    index = index + 1;
end


% pow = src .* src;
% 
% sample = zeros(1, ceil(length(src) / Ts));
% index = 1;
% for i = 1:Ts:length(src)-Ts
%     sample(index) = sum(pow(i:i+Ts-1));
%     index = index+1;
% end
% 
% Tps = 5;
% Tperiod = zeros(1, ceil(length(sample) / 500));
% index = 1;
% for i = 1:500:length(sample)-500
%     Tperiod(index) = period(sample(i:i+499), Ts/4)
%     index = index + 1;
% end
