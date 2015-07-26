% Chapter 8: Example 8.2

%            Calculation of Butterworth Ha(s) given |Ha(jW)|

%

N = 3; OmegaC = 0.5;

[b,a] = u_buttap(N,OmegaC);

[C,B,A] = sdir2cas(b,a)

%%C = 0.1250

%%B = 0     0     1

%%A = 1.0000    0.5000    0.2500

%%         0    1.0000    0.5000