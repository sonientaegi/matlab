w = [0:1:500]*pi/500;  % [0, pi] axis divided into 501 points.

X = exp(j*w) ./ (exp(j*w) - 0.5*ones(1,501));

magX = abs(X); angX = angle(X);

realX = real(X); imagX = imag(X);

subplot(2,2,1); plot(w/pi,magX); grid

xlabel('frequency in pi units'); title('Magnitude Part'); ylabel('Magnitude')

subplot(2,2,3); plot(w/pi,angX); grid

xlabel('frequency in pi units'); title('Angle Part'); ylabel('Radians')

subplot(2,2,2); plot(w/pi,realX); grid

xlabel('frequency in pi units'); title('Real Part'); ylabel('Real')

subplot(2,2,4); plot(w/pi,imagX); grid

xlabel('frequency in pi units'); title('Imaginary Part'); ylabel('Imaginary')

