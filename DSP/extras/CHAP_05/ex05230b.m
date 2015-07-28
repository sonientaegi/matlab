% Chapter 05: Example 5.23 High speed convolution

%			part b) Plotting of saved data

%                               run after part a)

load times.txt -ascii;

conv_time=times(1,:);

hsconv_time=times(2,:);

n = 1:150; subplot(1,1,1); %set(gca,'LineWidth',10);

plot(n(25:150),conv_time(25:150),n(25:150),hsconv_time(25:150))

axis([0,180,0,0.4]);

set(gca,'XTickMode','manual','XTick',[25;50;75;100;125;150]);

set(gca,'YTickMode','manual','YTick',[0.05:0.05:0.35]); %grid

text(150,0.17,'highspeed')

text(150,0.155,'convolution')

text(150,0.34,'convolution')

xlabel('sequence length N'); ylabel('time in seconds');

title('Comparison of convolution times');