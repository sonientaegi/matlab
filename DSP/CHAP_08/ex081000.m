% Chapter 8: Example 8.10

%            Impulse Invariance Transformation

%                  Simple example

%

subplot(1,1,1); clg

c = [1,1]; d = [1,5,6]; T = 0.1; Fs = 1/T;

[b,a] = imp_invr(c,d,T)

%%b =  1.0000   -0.8966

%%a =  1.0000   -1.5595    0.6065

% Impulse response of the analog filter

t = [0:0.01:3]; subplot(2,1,1); impulse(c,d,t); 

axis([0,3,-0.1,1]);hold on

% Impulse response of the digital filter

n = [0:1:3/T]; hn = filter(b,a,impseq(0,0,3/T));

stem(n*T,hn); xlabel('time in sec'); title ('Impulse Responses');

hold off

% Magnitude Response of the digital filter

[db,magd,pha,grd,wd] = freqz_m(b,a);

% magnitude response of the analog filter

[db,mags,pha,ws] = freqs_m(c,d,2*pi*Fs);

subplot(2,1,2); plot(ws/(2*pi),mags*Fs,wd/(2*pi)*Fs,magd)

xlabel('frequency in Hz'); title('Magnitude Responses');

ylabel('Magnitude'); 

text(1.4,.5,'Analog filter'); text(1.5,1.5,'Digital filter')