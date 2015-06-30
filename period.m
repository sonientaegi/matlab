function [ T ] = period( src, Fs )
% 일반적으로 가장 빠른 음악의 템포를 미리 지정 
MAX_TEMPO = 300;
Tmin = 60 / MAX_TEMPO * Fs;

% Auto correlation 수행
y = xcorr(src, fliplr(src));
y = abs(y);
n = ([1:length(y)] - length(y)/2)/Fs;

plot(n, y);

% 최대 Peak 검출
[value, index] = max(y);   % Value, Index
peakMax  = [value, index];
peakNext = [y(length(y)), length(y)];

for i = [peakMax(2) + Tmin : length(y)] 
    if peakNext(1) < y(i)
        peakNext = [y(i), i];
    end
end
    
T = peakNext(2) - peakMax(2);
T = T / Fs;
end

