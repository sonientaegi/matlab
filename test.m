START   = 0;
STOP    = -1;

[data Fs] = audioreadcut('music/catandi.mp3', START, STOP);

T = periods2(data, Fs, 4);
t = [0:length(T)-1]/Fs+START;
plot(t,T);
axis tight;