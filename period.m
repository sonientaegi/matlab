function [ T ] = period( src, Fs )
% 일반적으로 가장 빠른 음악의 템포를 미리 지정 
MAX_TEMPO = 300;
Tmin = 60 / MAX_TEMPO * Fs * 2;

% Auto correlation 수행
y = xcorr(src); %conv(src, fliplr(src));
nCenter = length(src);
plot([-nCenter+1:nCenter-1]/Fs, y);

% 2nd Peak 검출
peakNext = [length(y), y(length(y))];
% valleyNext = [nCenter, 
for i = nCenter+Tmin:length(y)
    if y(i) > peakNext(2)
        peakNext = [i, y(i)];
    end
end
T = peakNext(1) - nCenter;
T = T / Fs;
end

