% Computational Complexity of FFT using MATLAB

%

Nmax = 2048;

fft_time=zeros(1,Nmax);

for n=1:1:Nmax

   disp(n);

   x=ones(1,n);

   t=clock;fft(x);fft_time(n)=etime(clock,t);

end

n=[1:1:Nmax];

plot(n,fft_time,'.');

save fft_time.mat fft_time n;

