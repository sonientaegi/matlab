% Chapter 8: Example 8.30

%            Chebyshev-2 Bandstop Filter Design:

%                Use of the CHEBY2 function

%

% Digital Filter Specifications:        % Type: Chebyshev-II Bandstop

ws = [0.4*pi 0.7*pi];                   % Dig. stopband edge frequency

wp = [0.25*pi 0.8*pi];                  % Dig. passband edge frequency

Rp = 1;	                                % Passband ripple in dB

As = 40;                                % Stopband attenuation in dB

Ripple = 10 ^ (-Rp/20);                 % Passband ripple

Attn = 10 ^ (-As/20);                   % Passband attenuation



% Calculations of Chebyshev-II Filter Parameters:

[N,wn] = cheb2ord(wp/pi,ws/pi,Rp,As);



% Digital Chebyshev-II Bandstop Filter Design:

[b,a] = cheby2(N,As,ws/pi,'stop');



% Cascade Form Realization:

[b0,B,A] = dir2cas(b,a)

%%b0 = 0.1558

%%B = 1.0000    1.1456    1.0000

%%    1.0000    0.8879    1.0000

%%    1.0000    0.3511    1.0000

%%    1.0000   -0.2434    1.0000

%%    1.0000   -0.5768    1.0000

%%A = 1.0000    1.3041    0.8031

%%    1.0000    0.8901    0.4614

%%    1.0000    0.2132    0.2145

%%    1.0000   -0.4713    0.3916

%%    1.0000   -0.8936    0.7602



% Plotting:

[db,mag,pha,grd,w] = freqz_m(b,a);

subplot(2,2,1);plot(w/pi,mag);grid;title('Magnitude Response')

xlabel('Digital frequency in pi units'); axis([0 1 0 1])

set(gca,'XTickMode','manual','XTick',[0;0.25;0.4;0.7;0.8;1])

set(gca,'YTickMode','manual','YTick',[0;Ripple;1])

subplot(2,2,3);plot(w/pi,db);grid;title('Magnitude in dB')

xlabel('Digital frequency in pi units'); axis([0 1 -50 0]);

set(gca,'XTickMode','manual','XTick',[0;0.25;0.4;0.7;0.8;1])

set(gca,'YTickMode','manual','YTick',[-40;0])

subplot(2,2,2);plot(w/pi,pha/pi);grid;title('Phase Response')

xlabel('Digital frequency in pi units');ylabel('phase in pi units') 

set(gca,'XTickMode','manual','XTick',[0;0.25;0.4;0.7;0.8;1])

subplot(2,2,4);plot(w/pi,grd);grid;title('Group Delay')

xlabel('Digital frequency in pi units'); 

set(gca,'XTickMode','manual','XTick',[0;0.25;0.4;0.7;0.8;1])

subplot;