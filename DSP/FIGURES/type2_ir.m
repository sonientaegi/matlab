% Chapter 7 Matlab Figure on 

%           sym impulse response even M

%

subplot(1,1,1)

% ODD M

h = [-4,1,-1,-2,5,6,6,5,-2,-1,1,-4];

M = length(h); n = 0:M-1; alpha = (M-1)/2;

subplot(2,1,2);

stem(n,h); axis([-1,M,-5,8]);

title('Symmetric Impulse Response: M even')

xlabel('n'); ylabel('h(n)')

set(gca,'XTickMode','manual','XTick',[0,5,6,11],'Xgrid','on')

set(gca,'XTickLabelMode','manual',...

        'XTickLabels',['  0  ';'M/2+1';' M/2 ';' M-1 '])

set(gca,'YTickMode','manual','YTick',[0],'Ygrid','off')

set(gca,'YTickLabelMode','manual','YTickLabels',['0'])

