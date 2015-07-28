% Chapter 6 : Example 6.3

%             Mixed form conversion

%

C = []; B1 = [2,4;3,1]; A1 = [1,1,0.9;1,0.4,-0.4];

B2 = [0.5,0.7;1.5,2.5;0.8,1]; A2 = [1,-1,0.8;1,0.5,0.5;1,0,-0.5];

[b1,a1] = par2dir(C,B1,A1)

[b2,a2] = par2dir(C,B2,A2)

b = conv(b1,b2)

a = conv(a1,a2)

[b0,Bc,Ac] = dir2cas(b,a)

[C,Bp,Ap] = dir2par(b,a)