%surface plot of equation (4)
n=100;
x=linspace(-1.5,1.5,n);
y=linspace(-1.5,1.5,n);
[X,Y]=meshgrid(x,y);
F=X+Y+X.^2/4-Y.^2+(Y.^2-X/2).^2;
surf(X,Y,F);
xlabel('x')
ylabel('y')
zlabel('f(x,y)')