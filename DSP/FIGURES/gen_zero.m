% Chapter 7 Matlab Figure on 

%           A general Zero Constellation

%

subplot(1,1,1)

r = 0.6; theta = 50*pi/180;

z1 = r*exp(j*theta);       % an arbitrary zero location

z2 = 1/z1;                 % a linear-phase zero location

z3 = conj(z1);             % a conjugate zero location

z4 = 1/z3;                 % a linear-phase conjugate zero location

b = poly([z1,z2,z3,z4]);

pzplotz(b,1)

text(real(z1)-0.1,imag(z1)+0.15,'z1')

text(real(z3)-0.2,imag(z3)-0.15,'conj(z1)')

text(real(z2)-0.1,imag(z2)+0.15,'1/z1')

text(real(z4)-0.2,imag(z4)-0.15,'1/conj(z1)')