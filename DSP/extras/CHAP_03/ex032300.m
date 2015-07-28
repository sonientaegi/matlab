% Chapter 3 : Example 3.21

%             Reconstruction and aliasing using cubic splines

%

% Discrete-time Signal x2(n)

Ts = 0.001; n = -5:1:5; nTs = n*Ts;

x = exp(-1000*abs(nTs));

% Analog Signal reconstruction

Dt = 0.00005;

t = -0.005:Dt:0.005;

xa = spline(nTs,x,t);

% check

error = max(abs(xa - exp(-1000*abs(t))))

% Plots

subplot(1,1,1)

subplot(2,1,2);plot(t*1000,xa);

xlabel('t in msec.'); ylabel('xa(t)')

title('Reconstructed Signal from x2(n)'); hold on

stem(n*Ts*1000,x); hold off



