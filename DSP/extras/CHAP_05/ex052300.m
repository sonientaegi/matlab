% Chapter 05: Example 5.23 High speed convolution

%

conv_time = zeros(1,150); fft_time = zeros(1,150);

%

for N = 1:150

    tc = 0; tf=0;

    L = 2*N-1; nu = round((log10(L)/log10(2))+0.45); L = 2^nu;

    for I=1:100

       h = randn(1,N);

       x = rand(1,N);

      t0 = clock; y1 = conv(h,x); t1=etime(clock,t0);

      tc = tc+t1;

      t0 = clock; y2 = ifft(fft(h,L).*fft(x,L)); t2=etime(clock,t0);

      tf = tf+t2;

    end

%

    conv_time(N)=tc/100;

    fft_time(N)=tf/100;

end

%

n = 1:150; subplot(1,1,1);

plot(n(25:150),conv_time(25:150),n(25:150),fft_time(25:150))

save times.txt conv_time fft_time -ascii -tabs

