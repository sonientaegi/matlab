% Chapter 05: Example 5.22 Ploting of FFT execution times

%

load fft_time.mat;

top = ceil(max(fft_time));

%n = 1:2048;

subplot

clg

plot(n,fft_time,'.');axis([0,2500,0,50])

xlabel('N');ylabel('Time in Sec.')

title('FFT execution times')

text(2100,top,'o(N*N)')

text(2100,top/2,'o(N*N/2)')

text(2100,top/3,'o(N*N/3)')

text(2100,top/4,'o(N*N/4)')

text(2100,1,'o(N*logN)')

