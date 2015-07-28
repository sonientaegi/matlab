% Chapter 7 Figure mfile:

%           Mfile to introduce PM algorithm,

%

% a) equiripple amplitude response

figure(1); subplot(1,1,1)

f = [0,0.3,0.5,1]; m = [1,1,0,0]; weights = [0.5,1];

h = remez(8,f,m,weights);

M = length(h); n = 0:M-1;

[Hr,w,a,L] = Hr_Type1(h);

plot(w/pi,Hr);axis([0,1,-0.15,1.15])

xlabel('frequency in pi units');

title('Amplitude Response of an Equiripple Filter');hold on

wp = w(1:151); ws = w(251:501);

delta1 = max(Hr(1:151))-1; UPL = 1+delta1; LPL = 1-delta1;

upb=UPL*ones(length(wp),1);

lpb=LPL*ones(length(wp),1);

ipb=ones(length(wp),1);

plot(wp/pi,upb,'r',wp/pi,ipb,'g',wp/pi,lpb,'r')

delta2 = Hr(251); USL = delta2; LSL = -delta2;

As = -20*log10(USL/UPL)

usb=USL*ones(length(ws),1);

isb=zeros(length(ws),1);

lsb=LSL*ones(length(ws),1);

plot(ws/pi,usb,'r',ws/pi,isb,'g',ws/pi,lsb,'r');

set(gca,'XTickMode','manual','XTick',[0,0.3,0.5,1])

set(gca,'XTickLabelMode','manual','XTickLabels',[' 0 ';'0.3';'0.5';' 1 '])

set(gca,'XGrid','on')

set(gca,'YTickMode','manual','YTick',[LSL,0,USL,LPL,1,UPL])

%set(gca,'YTickLabelMode','manual',...

%        'YTickLabels',['-0.05';' 0.0 ';' 0.05';' 0.90';' 1.0 ';' 1.10'])

text(0.31,1,'Ideal Response');

text(0.32,0.0,'Ideal Response')

hold off

%print -deps2 equir_ar.eps

%

% Error function plots

figure(2); clg: subplot(2,1,1); 

erpb=Hr(1:151)-ipb; ersb=Hr(251:501)-isb;

plot(wp/pi,erpb,ws/pi,ersb); axis([0,1,-.15,.15]);

xlabel('frequency in pi units');

title('Error Function');hold on

plot(wp/pi,upb-ipb,'r',wp/pi,lpb-ipb,'r')

plot(ws/pi,usb-isb,'r',ws/pi,lsb-isb,'r');

set(gca,'XTickMode','manual','XTick',[0,0.3,0.5,1])

set(gca,'XTickLabelMode','manual','XTickLabels',[' 0 ';'0.3';'0.5';' 1 '])

set(gca,'XGrid','on')

set(gca,'YTickMode','manual','YTick',[-delta1,LSL,0,USL,delta1])

%set(gca,'YTickLabelMode','manual',...

%        'YTickLabels',['-0.10';'-0.05';' 0.0 ';' 0.05';' 0.10'])

%plot([0,0.5],[-0.05,-0.05],'-.')

hold off

%print -deps2 errorfun.eps

%

% Weighted function plots

figure(2); subplot(2,1,2); 

werpb = weights(1)*erpb; wersb = weights(2)*ersb;

plot(wp/pi,werpb,ws/pi,wersb); axis([0,1,-.1,.1]);

xlabel('frequency in pi units');

title('Weighted Error Function');hold on

plot(wp/pi,weights(1)*(upb-ipb),'r',wp/pi,weights(1)*(lpb-ipb),'r')

plot(ws/pi,weights(2)*(usb-isb),'r',ws/pi,weights(2)*(lsb-isb),'r');

set(gca,'XTickMode','manual','XTick',[0,0.3,0.5,1])

set(gca,'XTickLabelMode','manual','XTickLabels',[' 0 ';'0.3';'0.5';' 1 '])

set(gca,'XGrid','on')

set(gca,'YTickMode','manual','YTick',[LSL,0,USL])

%set(gca,'YTickLabelMode','manual',...

%        'YTickLabels',['-0.05';' 0.0 ';' 0.05'])



text(0.08,0.075,'weight = 0.5')

text(0.70,0.075,'weight = 1.0')

hold off

%print -deps2 wterrfn.eps

%

% Window Design

figure(3); subplot(1,1,1)

Mw = 11;

w_fun = ones(1,Mw);

%w_fun = (triang(Mw))';

%w_fun = (hanning(Mw))';

hd = ideal_lp(0.4*pi,Mw);

hw = hd.*w_fun;

[Hrw,w,a,L] = Hr_Type1(hw);

plot(w/pi,Hrw);axis([0,1,-0.15,1.15])

xlabel('frequency in pi units');

title('Amplitude Response of Window designed Filter');hold on

plot(wp/pi,upb,'r',wp/pi,ipb,'g',wp/pi,lpb,'r')

plot(ws/pi,usb,'r',ws/pi,isb,'g',ws/pi,lsb,'r');

set(gca,'XTickMode','manual','XTick',[0,0.3,0.5,1])

set(gca,'XTickLabelMode','manual','XTickLabels',[' 0 ';'0.3';'0.5';' 1 '])

set(gca,'XGrid','on')

set(gca,'YTickMode','manual','YTick',[LSL,0,USL,LPL,1,UPL])

%set(gca,'YTickLabelMode','manual',...

%        'YTickLabels',['-0.05';' 0.0 ';' 0.05';' 0.90';' 1.0 ';' 1.10'])

text(0.31,1,'Ideal Response');

text(0.32,0.0,'Ideal Response')

hold off

