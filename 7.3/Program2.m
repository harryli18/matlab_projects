% A x-y plot of phi
x0=-1.0;
y0=-1.3;
df1=@(x,y)1+x-y^2;
df2=@(x,y)1-2*y+4*y*(y^2-x/2);
g1=df1(x0,y0);
g2=df2(x0,y0);
f=@(x,y)x+y+x^2/4-y^2+(y^2-x/2)^2;

phi=@(k)(x0-k*g1)+(y0-k*g2)+((x0-k*g1)^2)/4-(y0-k*g2)^2+((y0-k*g2)^2-(x0-k*g1)/2)^2;
fplot(phi,[0.08,0.085]);
xlabel('lambda')
ylabel('phi')