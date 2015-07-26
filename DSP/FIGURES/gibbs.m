% Chapter 7: Rectangular Window Gibbs Phenomenon

%

subplot(1,1,1); N = 1000;

% M = 7

M = 7; alpha = (M-1)/2;

n = -alpha:alpha;

w = ones(1,M);

omega = (2*pi/N)*[-N/2:N/2];

Wr = real(w*(exp(-j*n'*omega)));

db = 20*log10(abs(Wr)/max(Wr));

IntWr = cumsum(Wr)/N;

%

% plots

subplot(2,2,1); plot(omega/pi,IntWr);

axis([-1,1,-0.15,1.15]);

title('M = 7')

xlabel('frequency in pi units'); ylabel('Integrated Amplitude Response')

set(gca,'YTickMode','manual','YTick',[0,1])

set(gca,'XTickMode','manual','XTick',[-1,0,1]); grid

%

% M = 21

M = 21; alpha = (M-1)/2;

n = -alpha:alpha;

w = ones(1,M);

omega = (2*pi/N)*[-N/2:N/2];

Wr = real(w*(exp(-j*n'*omega)));

db = 20*log10(abs(Wr)/max(Wr));

IntWr = cumsum(Wr)/N;

%

% plots

subplot(2,2,2); plot(omega/pi,IntWr);

axis([-1,1,-0.15,1.15]);

title('M = 21')

xlabel('frequency in pi units'); ylabel('Integrated Amplitude Response')

set(gca,'YTickMode','manual','YTick',[0,1])

set(gca,'XTickMode','manual','XTick',[-1,0,1]); grid

%

% M = 51

M = 51; alpha = (M-1)/2;

n = -alpha:alpha;

w = ones(1,M);

omega = (2*pi/N)*[-N/2:N/2];

Wr = real(w*(exp(-j*n'*omega)));

db = 20*log10(abs(Wr)/max(Wr));

IntWr = cumsum(Wr)/N;

%

% plots

subplot(2,2,3); plot(omega/pi,IntWr);

axis([-1,1,-0.15,1.15]);

title('M = 51')

xlabel('frequency in pi units'); ylabel('Integrated Amplitude Response')

set(gca,'YTickMode','manual','YTick',[0,1])

set(gca,'XTickMode','manual','XTick',[-1,0,1]); grid

%

% M = 101

M = 101; alpha = (M-1)/2;

n = -alpha:alpha;

w = ones(1,M);

omega = (2*pi/N)*[-N/2:N/2];

Wr = real(w*(exp(-j*n'*omega)));

db = 20*log10(abs(Wr)/max(Wr));

IntWr = cumsum(Wr)/N;

%

% plots

subplot(2,2,4); plot(omega/pi,IntWr);

axis([-1,1,-0.15,1.15]);

title('M = 101')

xlabel('frequency in pi units'); ylabel('Integrated Amplitude Response')

set(gca,'YTickMode','manual','YTick',[0,1])

set(gca,'XTickMode','manual','XTick',[-1,0,1]); grid

