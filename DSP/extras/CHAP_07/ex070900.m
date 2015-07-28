% Chapter 07: Example 7.9 Lowpass filter design - Kaiser window

%

wp = 0.2*pi; ws = 0.3*pi; As = 50;

tr_width = ws - wp;

M = ceil((As-7.95)/(14.36*tr_width/(2*pi))+1) + 1

n=[0:1:M-1];

beta = 0.1102*(As-8.7)

wc = (ws+wp)/2;

hd = ideal_lp(wc,M);

w_kai = (kaiser(M,beta))';

h = hd .* w_kai;

[db,mag,pha,grd,w] = freqz_m(h,[1]);

delta_w = 2*pi/1000;

As = -round(max(db(ws/delta_w+1:1:501))) % Min Stopband Attenuation

% Plots

subplot(1,1,1)

subplot(2,2,1); stem(n,hd); title('Ideal Impulse Response')

axis([0 M-1 -0.1 0.3]); xlabel('n'); ylabel('hd(n)')

subplot(2,2,2); stem(n,w_kai);title('Kaiser Window')

axis([0 M-1 0 1.1]);  xlabel('n'); ylabel('w(n)')

subplot(2,2,3); stem(n,h);title('Actual Impulse Response')

axis([0 M-1 -0.1 0.3]); xlabel('n'); ylabel('h(n)')

subplot(2,2,4);plot(w/pi,db);title('Magnitude Response in dB');grid

axis([0 1 -100 10]); xlabel('frequency in pi units'); ylabel('Decibels')

set(gca,'XTickMode','manual','XTick',[0,0.2,0.3,1])

set(gca,'YTickMode','manual','YTick',[-50,0])

set(gca,'YTickLabelMode','manual','YTickLabels',['50';' 0'])