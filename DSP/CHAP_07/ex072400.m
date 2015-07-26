% Chapter 7 Example 7.24

%           Bandpass filter design using PM algorithm

%

ws1 = 0.2*pi; wp1 = 0.35*pi; wp2 = 0.65*pi; ws2 = 0.8*pi;

Rp = 1.0; As = 60;

delta1 = (10^(Rp/20)-1)/(10^(Rp/20)+1);

delta2 = (1+delta1)*(10^(-As/20));

deltaH = max(delta1,delta2); deltaL = min(delta1,delta2);

weights = [1 delta2/delta1 1];

delta_f =min((ws2-wp2)/(2*pi), (wp1-ws1)/(2*pi));

M = ceil((-20*log10(sqrt(delta1*delta2))-13)/(14.6*delta_f)+1)

f = [0 ws1/pi wp1/pi wp2/pi ws2/pi 1];

m = [0 0 1 1 0 0];

h = remez(M-1,f,m,weights);

[db,mag,pha,grd,w] = freqz_m(h,[1]);

delta_w=2*pi/1000;

ws1i=floor(ws1/delta_w)+1; wp1i = floor(wp1/delta_w)+1;

ws2i=floor(ws2/delta_w)+1; wp2i = floor(wp2/delta_w)+1;

Asd = -max(db(1:1:ws1i))

M = M+1;

h = remez(M-1,f,m,weights);

[db,mag,pha,grd,w] = freqz_m(h,[1]);

Asd = -max(db(1:1:ws1/delta_w))

M = M+1;

h = remez(M-1,f,m,weights);

[db,mag,pha,grd,w] = freqz_m(h,[1]);

Asd = -max(db(1:1:ws1/delta_w))

M = M+1;

h = remez(M-1,f,m,weights);

[db,mag,pha,grd,w] = freqz_m(h,[1]);

Asd = -max(db(1:1:ws1/delta_w))

M

[Hr,omega,P,L] = ampl_res(h);

%

% Plots

figure(1); subplot(1,1,1)

subplot(2,2,1); stem([0:1:M-1],h); title('Actual Impulse Response')

axis([0,M-1,-0.4,0.5]); xlabel('n'); ylabel('h(n)')

set(gca,'XTickMode','manual','XTick',[0,M-1])

set(gca,'YTickMode','manual','YTick',[-0.4:0.2:0.5])

subplot(2,2,2);plot(w/pi,db);title('Magnitude Response in dB');

axis([0,1,-80,10]); xlabel('frequency in pi units'); ylabel('DECIBELS')

set(gca,'XTickMode','manual','XTick',f)

set(gca,'YTickMode','manual','YTick',[-60,0]);

set(gca,'YTickLabelMode','manual','YTickLabels',['60';' 0']);grid

subplot(2,2,3);plot(omega/pi,Hr);title('Amplitude Response');

axis([0 1 -0.1 1.1]); xlabel('frequency in pi units'); ylabel('Hr(w)')

set(gca,'XTickMode','manual','XTick',f)

set(gca,'YTickMode','manual','YTick',[0,1]);grid

delta_w = 2*pi/1000; sp_edge1 = ws1/delta_w+1; sp_edge2 = ws2/delta_w+1;

subplot(2,2,4);

sb1w = omega(1:1:ws1i)/pi; sb1e = Hr(1:1:ws1i); 

pbw = omega(wp1i:wp2i)/pi; pbe = Hr(wp1i:wp2i)-1;

sb2w = omega(ws2i:501)/pi; sb2e = Hr(ws2i:501); 

plot(sb1w,sb1e,pbw,pbe*(delta2/delta1),sb2w,sb2e);

title('Weighted Error');

axis([0,1,-deltaL,deltaL]);

xlabel('frequency in pi units'); ylabel('Hr(w)')

set(gca,'XTickMode','manual','XTick',f)

set(gca,'YTickMode','manual','YTick',[-deltaL,0,deltaL]);

set(gca,'XGrid','on','YGrid','on')

