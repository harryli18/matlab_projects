n=0;
x0=0.676;
y0=0.443;
fx=@(x,y)-2*(1-x)-320*x*(y-x^2);
fy=@(x,y)160*(y-x^2);
fx0=fx(x0,y0);
fy0=fy(x0,y0);
f=@(x,y)(1-x)^2+80*((y-x^2)^2);
phi=@(k)(1-(x0-k*fx0))^2+80*(((y0-k*fy0)-(x0-k*fx0)^2)^2);
kstar=fminbnd(phi,-10,10);
x1=x0-kstar*fx0;
y1=y0-kstar*fy0;
d=f(x1,y1)-f(x0,y0)
scatter(n+1,d,'filled')
%scatter(n+1,y1)
hold on
fx1=fx(x1,y1);
fy1=fy(x1,y1);
sx0=-fx0;
sy0=-fy0;

while n<80
      
    beta1=(fx1^2+fy1^2)/(fx0^2+fy0^2);
    sx1=-fx1+beta1*sx0;
    sy1=-fy1+beta1*sy0;
    phi=@(k)(1-(x1+k*sx1))^2+80*(((y1+k*sy1)-(x1+k*sx1)^2)^2);
    kstar=fminbnd(phi,-10,10);
    x2=x1+kstar*sx1;
    y2=y1+kstar*sy1;
    fx2=fx(x2,y2);
    fy2=fy(x2,y2);
    F=f(x2,y2);
    d=f(x2,y2)-f(x1,y1)
    scatter(n+2,d,'filled')
    %scatter(n+2,y2)
   hold on
    x0=x1;
    y0=y1;
    fx0=fx1;
    fy0=fy1;
    sx0=sx1;
    sy0=sy1;
    x1=x2;
    y1=y2;
    fx1=fx2;
    fy1=fy2;
    n=n+1;
    
if norm([x1 y1]-[x0 y0])<10^-8
    n=2500;
end

end
ylabel('d')
legend('d')
