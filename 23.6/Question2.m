x = linspace(1,100,1000);
y=(1-x.^(-1/2))/(6*pi);
plot(x,y)
xlabel('R/Rin(in units m dot)')
ylabel('nu*sigma(in units m dot)')