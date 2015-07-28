% Chapter 7: Example 7.5 Type-2 Linear phase FIR filter

%

subplot(1,1,1)

h = [-4,1,-1,-2,5,6,6,5,-2,-1,1,-4];

M = length(h); n = 0:M-1;

[Hr,w,b,L] = Hr_Type2(h);

bmax = max(b)+1; bmin = min(b)-1;

subplot(2,2,1); stem(n,h); axis([-1 2*L+1 bmin bmax])

xlabel('n'); ylabel('h(n)'); title('Impulse Response')

subplot(2,2,3); stem(1:L,b); axis([-1 2*L+1 bmin bmax])

xlabel('n'); ylabel('b(n)'); title('b(n) coefficients')

subplot(2,2,2);plot(w/pi,Hr);grid

xlabel('frequency in pi units'); ylabel('Hr')

title('Type-2 Amplitude Response')

subplot(2,2,4);pzplotz(h,1)

