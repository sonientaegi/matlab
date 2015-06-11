function [ Xz ] = ztran( form, N )
syms k;
Z(k) = exp(j*2*pi/N*k);
Xz = eval(form(Z(0:N-1)));
end

