% Chapter 05: Example-5.17: Overlap and save

%

n = 0:9;

x = n+1; Lenx = length(x);

h = [1,0,-1]; M = 3; M1 = M-1; L = N-M1;

N = 6; h = [h zeros(1,N-M)];

%

x = [zeros(1,M1), x, zeros(1,N-1)];

K = floor((Lenx+M1-1)/(L));

Y = zeros(K+1,N);

for k=0:K

	xk = x(k*L+1:k*L+N);

	Y(k+1,:) = circonvf(xk,h,N);

end

Y = Y(:,M:N)';

y = (Y(:))';

