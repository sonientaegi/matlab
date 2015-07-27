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