function [ src, Fs ] = audioreadcut( filename, cutFrom, cutTo )
[src Fs] = audioread(filename);
src = src(cutFrom*Fs:cutTo*Fs);
end

