function [ dst ] = downsamplef( src, downratef )
sz = size(src);
channels = sz(1);
elements = sz(2);

dst = zeros(channels, ceil(elements / downratef));
for i = 1 : elements / downratef
    dst(:, i) = src(:, round(i * downratef));
end

end

