%Q2-first part 
n=0;
x0=-1.0;
y0=-1.3;
df1=@(x,y)1+x-y^2;
df2=@(x,y)1-2*y+4*y*(y^2-x/2);
g1=df1(x0,y0);
g2=df2(x0,y0);
f=@(x,y)x+y+x^2/4-y^2+(y^2-x/2)^2;
fstar=f((1/2)^(2/3)-1,-(1/2)^(1/3));

while n<6
  
phi=@(k)(x0-k*g1)+(y0-k*g2)+((x0-k*g1)^2)/4-(y0-k*g2)^2+((y0-k*g2)^2-(x0-k*g1)/2)^2;
kstar=fminbnd(phi,-10,10);
x1=x0-kstar*g1;
y1=y0-kstar*g2;
%d=decrease achieved over the last step
d=f(x1,y1)-f(x0,y0);
h=d
E=fstar-f(x1,y1)
scatter(n+1,d,'filled')
xlabel('n')
ylabel('d(xn)')
hold on 
if norm([x1 y1]-[x0 y0])<10^-6
    n=1200;
end
x0=x1;
y0=y1;
g1=df1(x0,y0);
g2=df2(x0,y0); 
n=n+1;


    end 
hold off
