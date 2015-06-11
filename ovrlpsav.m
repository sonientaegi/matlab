function [ y ] = ovrlpsav( x, h, N )
    xa = x;
    remain = mod(length(x), N);
    if remain ~= 0
        xa(length(x) + [1:N-remain]) = 0;
    end
        
    y = circonvt(x
end

