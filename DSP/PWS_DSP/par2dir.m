function [b,a] = par2dir(C,B,A);

% PARALLEL-to-DIRECT form conversion

% ----------------------------------

% [b,a] = par2dir(C,B,A)

%  b = numerator polynomial coefficients of DIRECT form

%  a = denominator polynomial coefficients of DIRECT form

%  C = Polynomial part of PARALLEL form

%  B = K by 2 matrix of real coefficients containing bk's

%  A = K by 3 matrix of real coefficients containing ak's

%

[K,L] = size(A); R = []; P = [];



for i=1:1:K

	[r,p,k]=residuez(B(i,:),A(i,:));

	R = [R;r]; P = [P;p];

end

[b,a] = residuez(R,P,C);

b = b(:)'; a = a(:)';