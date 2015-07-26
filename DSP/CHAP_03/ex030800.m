x = rand(1,11); n = 0:10;

k = 0:500; w = (pi/500)*k;

X = x * (exp(-j*pi/500)).^(n'*k);    % DTFT of x

% signal shifted by two samples

y = x; m = n+2;

Y = y * (exp(-j*pi/500)).^(m'*k);    % DTFT of y

% verification

Y_check = (exp(-j*2).^w).*X;         % multiplication by exp(-j2w)

error = max(abs(Y-Y_check))          % Difference

