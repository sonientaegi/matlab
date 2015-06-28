function [ x ] = iffts( X )
    [row, N] = size(X)
    x = zeros(1, row*N)
    for idxRow = 0:row-1
        x(N * idxRow + 1 : N * (idxRow + 1)) = ifft(X(idxRow+1, :))
    end
end

