y = zeros(1, length(x));
memory = zeros(2,3);
for k = 3:length(x)
    
    for i = 2:3
        s1 = memory(1,i) * A(1,i) * -1;
        s2 = memory(1,i) * B(1,i);
    end
    memory(1,3) = memory(1,2);
    memory(1,2) = memory(1,1);
    memory(1,1) = s1 + x(k);
    s2 = s2 + memory(1,1);
    
    for i = 2:3
        s3 = memory(2,i) * A(2,i) * -1;
        s4 = memory(2,i) * B(2,i);
    end
    memory(2,3) = memory(2,2);
    memory(2,2) = memory(2,1);
    memory(2,1) = s2 * C + s3;
    
    y(k) = s4 + memory(2,1);
end