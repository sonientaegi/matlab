w = [0:1:500]*pi/500;  % [0, pi] axis divided into 501 points.

X = exp(j*w) ./ (exp(j*w) - 0.9*ones(1,501));

magX = abs(X); angX = angle(X);

subplot(2,1,1); plot(w/pi,magX); grid; axis([0,1,0,10])

xlabel('frequency in pi units'); ylabel('|H|');

title('Magnitude Response');

subplot(2,1,2); plot(w/pi,angX/pi); grid

xlabel('frequency in pi units'); ylabel('Phase in pi Radians');

title('Phase Response');

