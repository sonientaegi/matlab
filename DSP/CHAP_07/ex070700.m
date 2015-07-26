% Chapter 7: Example 7.7 Type-4 Linear phase FIR filter

%

subplot(1,1,1)

h = [-4,1,-1,-2,5,6,-6,-5,2,1,-1,4];

M = length(h); n = 0:M-1;

[Hr,w,d,L] = Hr_Type4(h);

dmax = max(d)+1; dmin = min(d)-1;

subplot(2,2,1); stem(n,h); axis([-1 2*L+1 dmin dmax])

xlabel('n'); ylabel('h(n)'); title('Impulse Response')

subplot(2,2,3); stem(1:L,d); axis([-1 2*L+1 dmin dmax])

xlabel('n'); ylabel('d(n)'); title('d(n) coefficients')

subplot(2,2,2);plot(w/pi,Hr);grid

xlabel('frequency in pi units'); ylabel('Hr')

title('Type-4 Amplitude Response')

subplot(2,2,4);pzplotz(h,1)

