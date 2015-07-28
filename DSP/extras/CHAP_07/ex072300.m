% Chapter 7 Example 7.23

%           Lowpass filter design using PM algorithm

%

wp = 0.2*pi; ws = 0.3*pi; Rp = 0.25; As = 50;

delta1 = (10^(Rp/20)-1)/(10^(Rp/20)+1)

delta2 = (1+delta1)*(10^(-As/20))

deltaH = max(delta1,delta2); deltaL = min(delta1,delta2);

weights = [delta2/delta1 1]

deltaf = (ws-wp)/(2*pi)

M = ceil((-20*log10(sqrt(delta1*delta2))-13)/(14.6*deltaf)+1)

f = [0 wp/pi ws/pi 1]

m = [1 1 0 0];

h = remez(M-1,f,m,weights);

[db,mag,pha,grd,w] = freqz_m(h,[1]);

delta_w = 2*pi/1000; wsi=ws/delta_w+1; wpi = wp/delta_w;

Asd = -max(db(wsi:1:501))

M = M+1;

h = remez(M-1,f,m,weights);

[db,mag,pha,grd,w] = freqz_m(h,[1]);

Asd = -max(db(wsi:1:501))

M = M+1;

h = remez(M-1,f,m,weights);

[db,mag,pha,grd,w] = freqz_m(h,[1]);

Asd = -max(db(wsi:1:501))

M = M+1;

h = remez(M-1,f,m,weights);

[db,mag,pha,grd,w] = freqz_m(h,[1]);

Asd = -max(db(wsi:1:501))

M = M+1;

h = remez(M-1,f,m,weights);

[db,mag,pha,grd,w] = freqz_m(h,[1]);

Asd = -max(db(wsi:1:501))

M

[Hr,omega,P,L] = ampl_res(h);

%

% Plots

figure(1); subplot(1,1,1)

subplot(2,2,1); stem([0:1:M-1],h); title('Actual Impulse Response')

axis([0 M-1 -0.1 0.3]); xlabel('n'); ylabel('h(n)')

set(gca,'XTickMode','manual','XTick',[0,M-1])

set(gca,'YTickMode','manual','YTick',[-0.1:0.1:0.3])

subplot(2,2,2);plot(w/pi,db);title('Magnitude Response in dB');

axis([0,1,-80,10]); xlabel('frequency in pi units'); ylabel('DECIBELS')

set(gca,'XTickMode','manual','XTick',[0,0.2,0.3,1])

set(gca,'YTickMode','manual','YTick',[-50,0]);

set(gca,'YTickLabelMode','manual','YTickLabels',['50';' 0']);grid

subplot(2,2,3);plot(omega/pi,Hr);title('Amplitude Response');

axis([0 1 -0.1 1.1]); xlabel('frequency in pi units'); ylabel('Hr(w)')

set(gca,'XTickMode','manual','XTick',[0,0.2,0.3,1])

set(gca,'YTickMode','manual','YTick',[0,1]);grid

subplot(2,2,4);

pbw = omega(1:1:wpi+1)/pi; pbe = Hr(1:1:wpi+1)-1;

sbw = omega(wsi+1:501)/pi; sbe = Hr(wsi+1:501);

plot(pbw,pbe,sbw,sbe);

axis([0,1,-deltaH,deltaH]);title('Error Response');

xlabel('frequency in pi units'); ylabel('Hr(w)')

set(gca,'XTickMode','manual','XTick',[0,0.2,0.3,1])

set(gca,'YTickMode','manual','YTick',[-deltaH,-deltaL,0,deltaL,deltaH]);

set(gca,'XGrid','on')