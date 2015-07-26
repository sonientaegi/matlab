% Chapter 7: Example 7.3 Amplitude vs Magnitude response

%

h = [1,1,1];

w = [0:500]*pi/500;

H = freqz(h,1,w);

magH = abs(H); phaH = angle(H);

ampH = ones(1,501)+2*cos(w); angH = -w;

subplot(1,1,1)

subplot(2,2,1); plot(w/pi,magH); title('Magnitude Response');

xlabel('frequency in pi units'); ylabel('|H|'); grid

axis([0 1 -1.5 3.5]);

set(gca,'XTickMode','manual','XTick',[0;0.6667;1])

set(gca,'XTickLabelMode','manual','XTickLabels',[' 0 ';'2/3';' 1 '])

set(gca,'YTickMode','manual','YTick',[0])

subplot(2,2,3); plot(w/pi,phaH/pi); title('Piecewise Linear Phase Response');

xlabel('frequency in pi units'); ylabel('angle in pi units'); grid

axis([0 1 -1 1])

set(gca,'XTickMode','manual','XTick',[0;0.6667;1])

set(gca,'XTickLabelMode','manual','XTickLabels',[' 0 ';'2/3';' 1 '])

set(gca,'YTickMode','manual','YTick',[-0.6667;0;0.3333])

set(gca,'YTickLabelMode','manual','YTickLabels',['-2/3';'   0';' 2/3'])

subplot(2,2,2); plot(w/pi,ampH); title('Amplitude Response');

xlabel('frequency in pi units'); ylabel('Hr'); grid

axis([0 1 -1.5 3.5])

set(gca,'XTickMode','manual','XTick',[0;0.6667;1])

set(gca,'XTickLabelMode','manual','XTickLabels',[' 0 ';'2/3';' 1 '])

set(gca,'YTickMode','manual','YTick',[0])

subplot(2,2,4); plot(w/pi,angH/pi); title('Linear Phase Response');

xlabel('frequency in pi units'); ylabel('angle in pi units'); grid

axis([0 1 -1 1])

set(gca,'XTickMode','manual','XTick',[0;0.6667;1])

set(gca,'XTickLabelMode','manual','XTickLabels',[' 0 ';'2/3';' 1 '])

set(gca,'YTickMode','manual','YTick',[-0.6667;0])

set(gca,'YTickLabelMode','manual','YTickLabels',['-2/3';'   0'])

