% Chapter 3 : Example 3.22

%             Reconstruction using cubic splines

%

figure(1); clf

% a) Discrete-time Signal x1(n): Ts = 0.0002

Ts = 0.0002; n = -25:1:25; nTs = n*Ts;

x = exp(-1000*abs(nTs));

% Analog Signal reconstruction

Dt = 0.00005;

t = -0.005:Dt:0.005;

xa = spline(nTs,x,t);

% check

error = max(abs(xa - exp(-1000*abs(t))))

% Plots

subplot(2,1,1);plot(t*1000,xa);

xlabel('t in msec.'); ylabel('xa(t)')

title('Reconstructed Signal from x1(n) using cubic spline function'); hold on

stem(n*Ts*1000,x); hold off

%

% Discrete-time Signal x2(n): Ts = 0.001

Ts = 0.001; n = -5:1:5; nTs = n*Ts;

x = exp(-1000*abs(nTs));

% Analog Signal reconstruction

Dt = 0.00005;

t = -0.005:Dt:0.005;

xa = spline(nTs,x,t);

% check

error = max(abs(xa - exp(-1000*abs(t))))

% Plots

subplot(2,1,2);plot(t*1000,xa);

xlabel('t in msec.'); ylabel('xa(t)')

title('Reconstructed Signal from x2(n) using cubic spline function'); hold on

stem(n*Ts*1000,x); hold off