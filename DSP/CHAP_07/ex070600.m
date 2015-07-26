% Chapter 7: Example 7.6 Type-3 Linear phase FIR filter

%

subplot(1,1,1)

h = [-4,1,-1,-2,5,0,-5,2,1,-1,4];

M = length(h); n = 0:M-1;

[Hr,w,c,L] = Hr_Type3(h);

cmax = max(c)+1; cmin = min(c)-1;

subplot(2,2,1); stem(n,h); axis([-1 2*L+1 cmin cmax])

xlabel('n'); ylabel('h(n)'); title('Impulse Response')

subplot(2,2,3); stem(0:L,c); axis([-1 2*L+1 cmin cmax])

xlabel('n'); ylabel('c(n)'); title('c(n) coefficients')

subplot(2,2,2);plot(w/pi,Hr);grid

xlabel('frequency in pi units'); ylabel('Hr')

title('Type-3 Amplitude Response')

subplot(2,2,4);pzplotz(h,1)

