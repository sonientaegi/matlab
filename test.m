[src, Fs] = audioread('cat.mp3');
src = src(155*Fs : 160*Fs);
sound(src, Fs);