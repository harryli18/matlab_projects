%surface plot of equation (5)
n=100;
x=linspace(-1.5,1.5,n);
y=linspace(-1.5,1.5,n);
[X,Y]=meshgrid(x,y);
G=(1-X).^2+80*(Y-X.^2).^2;
surf(X,Y,G)
xlabel('x')
ylabel('y')
zlabel('g(x,y)')