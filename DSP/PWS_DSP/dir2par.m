function [C,B,A] = dir2par(b,a);

% DIRECT-form to PARALLEL-form conversion

% --------------------------------------

% [C,B,A] = dir2par(b,a)

%  C = Polynomial part when length(b) >= length(a)

%  B = K by 2 matrix of real coefficients containing bk's

%  A = K by 3 matrix of real coefficients containing ak's

%  b = numerator polynomial coefficients of DIRECT form

%  a = denominator polynomial coefficients of DIRECT form

%

M = length(b); N = length(a);



[r1,p1,C] = residuez(b,a);

p = cplxpair(p1,10000000*eps);

I = cplxcomp(p1,p);

r = r1(I);



K = floor(N/2); B = zeros(K,2); A = zeros(K,3);

if K*2 == N; %N even, order of A(z) odd, one factor is first order

	for i=1:2:N-2

		Brow = r(i:1:i+1,:);

		Arow = p(i:1:i+1,:);

		[Brow,Arow] = residuez(Brow,Arow,[]);

		B(fix((i+1)/2),:) = real(Brow');

		A(fix((i+1)/2),:) = real(Arow');

	end

	[Brow,Arow] = residuez(r(N-1),p(N-1),[]);

	B(K,:) = [real(Brow') 0]; A(K,:) = [real(Arow') 0];

else

        for i=1:2:N-1

		Brow = r(i:1:i+1,:);

		Arow = p(i:1:i+1,:);

		[Brow,Arow] = residuez(Brow,Arow,[]);

		B(fix((i+1)/2),:) = real(Brow');

		A(fix((i+1)/2),:) = real(Arow');

	end     

end

