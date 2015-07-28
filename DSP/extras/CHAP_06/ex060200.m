% Chapter 6 : Example 6.2

%             Parallel form conversion

%

b = [1,-3,11,-27,18]; a = [16,12,2,-4,-1];

[C,B,A] = dir2par(b,a)

format long; delta = impseq(0,0,7);

hpar = parfiltr(C,B,A,delta)

hdir = filter(b,a,delta)

[b1,a1] = par2dir(C,B,A)