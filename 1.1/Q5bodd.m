%RK4
n=1;
x0=0.1;
xn=10/pi;
y0=1;
z0=1;
h=0.01;
m=1000;
f=@(x,y,z)(z);
g=@(x,y,z)(-(z*x/x^2)-(x^2-n^2)*y/x^2);
y=zeros(1,m);
x=zeros(1,m);
y(1,1)=y0;
x(1,1)=x0;
for j=1:m+1
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
    
    x(j+1)=x1;
    y(j+1)=y1;
     xlabel('x')
   ylabel('y')

x0=x1;
y0=y1;
z0=z1;
end
 plot(x,y)
 hold on
 
m=1000;
x=linspace(0,1/pi,m/2);
k=linspace(-1/pi,1/pi,m);
J2hat=zeros(m,1);
J=besselj(n,x);
J(1)=(besselj(n,0)-besselj(n,1/pi))/2;
J1hat=(fft(J));
for j=1:m/2
J2hat(j)=imag(J1hat(j));
J2hat(m-j+1)=imag(J1hat(j));
end
plot(k,abs(J2hat));
 
m=100;
k=linspace(-1/pi,1/pi,m);
u=2*pi*k;
T=cos(n*acos(u));
l1=find(u>1);
l2=find(u<-1);
[d1 d2]=size(l2);
for j=l1:m;
    T(j)=0;
end
for j=1:d2
    T(j)=0;
end
Jthat=2*((-i)^n)*((1-4*pi^2*k.^2).^(-1/2)).*T;
plot(k,abs(Jthat))
xlabel('k')
ylabel('Jn/Jnhat')
legend('Jn','Jhat','Jhat(theoretical')
title('n=1')
xlim([-1/pi 1/pi])

