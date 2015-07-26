function [ src, Fs ] = audioreadcut( filename, cutFrom, cutTo )
[src, Fs] = audioread(filename);
if cutTo == -1 || cutTo*Fs > length(src)
    cutTo = floor(length(src) / Fs);
end
src = src(cutFrom*Fs+1:cutTo*Fs);
end

