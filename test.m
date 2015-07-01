[src, Fs] = audioread('music/destiny.mp3');

nSamples = length(src);
nBlock = 20*Fs;

T = zeros(1, ceil(nSamples / nBlock));
index = 1;
for k = 1 : length(T)-1
    src10Sec = src(index:index+nBlock-1);
    index = index+nBlock;
    srcBase = bpf(src10Sec, 32, 192, Fs, 1001);
    T(k) = period(srcBase, Fs);
end

src10Sec = src(index:length(src));
srcBase = bpf(src10Sec, 32, 192, Fs, 1001);
T(k+1) = period(srcBase);
T'
    