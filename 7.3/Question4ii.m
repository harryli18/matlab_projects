%Method of Conjugate gradients: first part of Q4

n=0;
x0=-1.0;
y0=-1.3;

fx=@(x,y)1+x-y^2;
fy=@(x,y)1-2*y+4*y*(y^2-x/2);
fx0=fx(x0,y0);
fy0=fy(x0,y0);
f=@(x,y)x+y+x^2/4-y^2+(y^2-x/2)^2;
fstar=f((1/2)^(2/3)-1,-(1/2)^(1/3));

phi=@(k)(x0-k*fx0)+(y0-k*fy0)+(x0-k*fx0)^2/4-(y0-k*fy0)^2+((y0-k*fy0)^2-(x0-k*fx0)/2)^2;
kstar=fminbnd(phi,-1,1)
x1=x0-kstar*fx0;
y1=y0-kstar*fy0;
F=f(x1,y1);
d=f(x1,y1)-f(x0,y0)

E=fstar-f(x1,y1)
scatter(n+1,d,'filled')
hold on
fx1=fx(x1,y1);
fy1=fy(x1,y1);
sx0=-fx0;
sy0=-fy0;

while n<11
    
    beta1=(fx1^2+fy1^2)/(fx0^2+fy0^2);
    sx1=-fx1+beta1*sx0;
    sy1=-fy1+beta1*sy0;
    phi=@(k)(x1+k*sx1)+(y1+k*sy1)+(x1+k*sx1)^2/4-(y1+k*sy1)^2+((y1+k*sy1)^2-(x1+k*sx1)/2)^2;
    kstar=fminbnd(phi,-10^10,10^10);
    x2=x1+kstar*sx1;
    y2=y1+kstar*sy1;
    fx2=fx(x2,y2);
    fy2=fy(x2,y2);
    F=f(x2,y2);
    d=f(x2,y2)-f(x1,y1)
    E=fstar-f(x2,y2)
    
    scatter(n+2,d,'filled')
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
    
if norm([x1 y1]-[x0 y0])<10^-6
    n=12;
end

end

ylabel('d')
hold off 