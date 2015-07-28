% Chapter 05: Example 05.20: Eigenvalues and eigenvectors

%

H = [1,4,3,2;2,1,4,3;3,2,1,4;4,3,2,1];

[V,D] = eig(H)

% verification

h = H(:,1)';

Hk = dft(h,4)

