function [ y ] = ovrlpsav( x, h, N )
    y = [];
    Nh = length(h)
    Nx = length(x)
    
    L = N-Nh+1;
    x = [zeros(1, Nh-1), x, zeros(1, L - mod(Nx, L))];
    for r = 0:Nx/L;
        n = 1+r*L;
        xp = x(n:n+L+Nh-2);
        yp = circonvt(xp, h, N);
        y = [y, yp(Nh:N)]; 
    end
    y = y(1:Nx+Nh-1);
end

