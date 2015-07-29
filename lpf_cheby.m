function [ y ] = lpf_cheby( x, Fp, Fc, Fs, Rp, As )
Wp = Fp/Fs*2*pi;
Ws = Fc/Fs*2*pi;
Op = 2*Fs*tan(Wp/2);
Os = 2*Fs*tan(Ws/2);
[cs, ds] = afd_chb1(Op, Os, Rp, As);
[b,a] = bilinear(cs, ds, Fs);

display('B = ');
for i = 1:length(b)
    disp(b(i));
end

display('A = ');
for i = 1:length(a)
    disp(a(i));
end

N = max(length(a), length(b));
y = zeros(1, length(x));
for k = [1:N-1] 
    y(k) = x(1);
end

for k = [N:length(x)]
    for i = [1:length(b)]
        y(k) = y(k) + b(i) * x(k-i+1) * a(1);
    end
    
    for i = [2:length(a)]
        y(k) = y(k) - a(i) * y(k-i+1);
    end
end


%{
[C,B,A] = dir2cas(b,a);

y = zeros(1, length(x));
memory = zeros(2,3);
for k = 3:length(x)
    memory(1,1) = x(k);
    memory(2,1) = 0;
    temp = 0;
    for i = 2:3
        memory(1,1) = memory(1,1) + memory(1,i) * A(1,i) * -1;
        temp = temp + memory(1,i) * B(1,i);
    end
    memory(1,3) = memory(1,2);
    memory(1,2) = memory(1,1);
    temp = temp + memory(1,1);
    memory(2,1) = temp * C;
    
    for i = 2:3
        memory(2,1) = memory(2,1) + memory(2,i) * A(2,i) * -1;
        y(k) = y(k) + memory(2,i) * B(2,i);
    end
    memory(2,3) = memory(2,2);
    memory(2,2) = memory(2,1);
    y(k) = y(k) + memory(2,1);
end
%}
end
