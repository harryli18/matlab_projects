%RK4
n=8;
x0=0.5;
xn=20;
y0=-3;
z0=1;
h=0.1;
m=round((xn-x0)/h);
f=@(x,y,z)(z);
g=@(x,y,z)(-(z*x/x^2)-(x^2-n^2)*y/x^2);

y=zeros(1,m);
x=zeros(1,m);
y(1,1)=y0;
x(1,1)=x0;


for n=1:m+1
    x1=x0+h;
    a1=f(x0,y0,z0);
    b1=g(x0,y0,z0);
     
    a2=f(x0+0.5*h,y0+0.5*h*a1,z0+0.5*h*b1);
    b2=g(x0+0.5*h,y0+0.5*h*a1,z0+0.5*h*b1);
   
    a3=f(x0+0.5*h,y0+0.5*h*a2,z0+0.5*h*b2);
    b3=g(x0+0.5*h,y0+0.5*h*a2,z0+0.5*h*b2);
     
    a4=f(x0+h,y0+h*a3,z0+h*b3);
    b4=g(x0+h,y0+h*a3,z0+h*b3);
      
    y1=y0+h*(a1/6+a2/3+a3/3+a4/6);
    z1=z0+h*(b1/6+b2/3+b3/3+b4/6);
    
    x(n+1)=x1;
    y(n+1)=y1;
     xlabel('x')
   ylabel('y')

x0=x1;
y0=y1;
z0=z1;
end


 plot(x,y)
 hold on
  