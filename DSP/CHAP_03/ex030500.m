subplot(1,1,1)

n = 0:10; x = (0.9*exp(j*pi/3)).^n;

k = -200:200; w = (pi/100)*k;

X = x * (exp(-j*pi/100)) .^ (n'*k);

magX = abs(X); angX =angle(X);

subplot(2,1,1); plot(w/pi,magX);grid

axis([-2,2,0,8])

xlabel('frequency in units of pi'); ylabel('|X|')

title('Magnitude Part')

subplot(2,1,2); plot(w/pi,angX/pi);grid

axis([-2,2,-1,1])

xlabel('frequency in units of pi'); ylabel('radians/pi')

title('Angle Part')

