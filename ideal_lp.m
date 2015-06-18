function [ hd ] = ideal_lp( wc, M )
m = [-(M-1)/2:+(M-1)/2];
fc = wc/pi;
hd = fc*sinc(fc*m);
end

