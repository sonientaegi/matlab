n = -5:10; x = rand(1,length(n)) + j*rand(1,length(n));

k = -100:100; w = (pi/100)*k;        % frequency between -pi and +pi

X = x * (exp(-j*pi/100)).^(n'*k);    % DTFT of x

% conjugation property

y = conj(x);                         % signal conjugation

Y = y * (exp(-j*pi/100)).^(n'*k);    % DTFT of y

% verification

Y_check = conj(fliplr(X));           % conj(X(-w))

error = max(abs(Y-Y_check))          % Difference

