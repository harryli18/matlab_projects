%Q3-first part 
n=0;
x0=0.676;
y0=0.443;

df1=@(x,y)-2*(1-x)-320*x*(y-x^2);
df2=@(x,y)160*(y-x^2);
g1=df1(x0,y0);
g2=df2(x0,y0);
f=@(x,y)(1-x)^2+80*((y-x^2)^2);

while n<5
    
     
phi=@(k)(1-(x0-k*g1))^2+80*(((y0-k*g2)-(x0-k*g1)^2)^2);
kstar=fminbnd(phi,-10,10)+10^-7;
x1=x0-kstar*g1;
y1=y0-kstar*g2;
%d=decrease achieved over the last step
d=f(x1,y1)-f(x0,y0)
scatter(n+1,x1,'filled','r')
%scatter(n+1,y1)
xlabel('n')
ylabel('d(xn)')
hold on
%disp([x0,y0]);
if norm([x1 y1]-[x0 y0])<10^-6
    n=2500;
end
x0=x1;
y0=y1;
g1=df1(x0,y0);
g2=df2(x0,y0); 
n=n+1;
    end 


