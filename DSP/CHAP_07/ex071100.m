% Chapter 07: Example 7.11 Bandstop filter design - Kaiser window

%

M = 45; As = 60; n=[0:1:M-1];

beta = 0.1102*(As-8.7)

w_kai = (kaiser(M,beta))';

wc1 = pi/3; wc2 = 2*pi/3;

hd = ideal_lp(wc1,M) + ideal_lp(pi,M) - ideal_lp(wc2,M);

h = hd .* w_kai;

[db,mag,pha,grd,w] = freqz_m(h,[1]);

%

subplot(1,1,1)

subplot(2,1,2);plot(w/pi,db);

title('Magnitude Response in dB');grid;

xlabel('frequency in pi units'); ylabel('Decibels')

axis([0 1 -80 10]); 

set(gca,'XTickMode','manual','XTick',[0;0.333;0.667;1])

set(gca,'XTickLabelMode','manual',...

    'XTickLabels',[' 0 ';'1/3';'2/3';' 1 '])

set(gca,'YTickMode','manual','YTick',[-60,0])

set(gca,'YTickLabelMode','manual','YTickLabels',['60';' 0'])

%pause;

print -deps2 ex071101.eps

%

M = 45; As = 60; n=[0:1:M-1];

beta = 0.1102*(As-8.7)+.3

w_kai = (kaiser(M,beta))';

wc1 = pi/3; wc2 = 2*pi/3;

hd = ideal_lp(wc1,M) + ideal_lp(pi,M) - ideal_lp(wc2,M);

h = hd .* w_kai;

[db,mag,pha,grd,w] = freqz_m(h,[1]);

%

% plots

subplot(1,1,1);

subplot(2,2,1); stem(n,hd); title('Ideal Impulse Response')

axis([-1 M -0.2 0.8]); xlabel('n'); ylabel('hd(n)')

subplot(2,2,2); stem(n,w_kai);title('Kaiser Window')

axis([-1 M 0 1.1]); xlabel('n'); ylabel('w(n)')

subplot(2,2,3); stem(n,h);title('Actual Impulse Response')

axis([-1 M -0.2 0.8]); xlabel('n'); ylabel('h(n)')

subplot(2,2,4);plot(w/pi,db);

title('Magnitude Response in dB');grid;

xlabel('frequency in pi units'); ylabel('Decibels')

axis([0 1 -80 10]); 

set(gca,'XTickMode','manual','XTick',[0;0.333;0.667;1])

set(gca,'XTickLabelMode','manual',...

    'XTickLabels',[' 0 ';'1/3';'2/3';' 1 '])

set(gca,'YTickMode','manual','YTick',[-60,0])

set(gca,'YTickLabelMode','manual','YTickLabels',['60';' 0'])

print -deps2 ex071102.eps