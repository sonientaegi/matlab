% Chapter 7: Example 7.22

%            Error function plot and counting of extrema

figure(1);subplot(1,1,1)

h = [1,2,3,4,3,2,1]/15;

M = length(h); n = 0:M-1;

[Hr,w,a,L] = Hr_Type1(h);

subplot(1,2,1);plot(w/pi,Hr);axis([0,1,-0.05,1.1])

xlabel('frequency in pi units');

title('Amplitude Response');hold on

wp = w(1:52); ws = w(197:500);

upb=Hr(1)*ones(length(wp),1);

lpb=(2-Hr(1))*ones(length(wp),1);

ipb=ones(length(wp),1);

plot(wp/pi,upb,'r',wp/pi,ipb,'g',wp/pi,lpb,'r')

usb=Hr(197)*ones(length(ws),1);

lsb=zeros(length(ws),1);

isb=0.5*usb;

plot(ws/pi,usb,'r',ws/pi,isb,'g',ws/pi,lsb,'r');

set(gca,'XTickMode','manual','XTick',[0,0.1,0.39,1])

set(gca,'XTickLabelMode','manual','XTickLabels',[' 0 ';'0.1';'0.4';' 1 '])

set(gca,'XGrid','on')

set(gca,'YTickMode','manual','YTick',[0,0.0394,0.0787,0.933,1,1.067])

set(gca,'YTickLabelMode','manual',...

        'YTickLabels',['-0.04';' 0.0 ';' 0.04';' 0.93';' 1.0 ';' 1.07'])

hold off

%

%Error function plots

subplot(1,2,2); 

erpb=Hr(1:52)-ipb; ersb=Hr(197:500)-isb;

plot(wp/pi,erpb,ws/pi,ersb); axis([0,1,-.55,.55]);

xlabel('frequency in pi units');

title('Error Function');hold on

plot(wp/pi,upb-ipb,'r',wp/pi,lpb-ipb,'r')

plot(ws/pi,usb-isb,'r',ws/pi,lsb-isb,'r');

set(gca,'XTickMode','manual','XTick',[0,0.1,0.39,1])

set(gca,'XTickLabelMode','manual','XTickLabels',[' 0 ';'0.1';'0.4';' 1 '])

set(gca,'XGrid','on')

set(gca,'YTickMode','manual','YTick',[-0.07,0,0.07])

hold off

