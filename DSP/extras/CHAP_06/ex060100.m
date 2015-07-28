% Chapter 6 : Example 6.1

%             Cascade form conversion

%

b = [1,-3,11,-27,18]; a = [16,12,2,-4,-1];

[b0,B,A] = dir2cas(b,a)

format long; delta = impseq(0,0,7);

hpar = casfiltr(b0,B,A,delta)

hdir = filter(b,a,delta)