% Matlab Example 2.10; Chapter 2

%

a=[1,-1,0.9];b=1;

% Part a)

x=impseq(0,-20,120);n=[-20:120];

h=filter(b,a,x);

subplot(2,1,1);stem(n,h)

axis([-20,120,-1.1,1.1])

title('Impulse Response');xlabel('n');ylabel('h(n)')

%

% Part b)

x=stepseq(0,-20,120);

s=filter(b,a,x);

subplot(2,1,2);stem(n,s)

axis([-20,120,-.5,2.5])

title('Step Response');xlabel('n');ylabel('s(n)')

%

%print -deps2 ex021000.eps

%

% Part c)

sum(abs(h))

z=roots(a);

magz=abs(z)

subplot

