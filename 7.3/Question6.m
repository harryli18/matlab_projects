n=1;
x0=zeros(3,1);
g0=zeros(3,1);
s0=zeros(3,1);
H0=eye(3)
X1=zeros(3,1);
X2=zeros(3,1);
G1=zeros(3,1);
S1=zeros(3,1);
H1=zeros(3,3);
p1=zeros(3,1);
q1=zeros(3,1);
x0(1)=1;
x0(2)=1;
x0(3)=1;
x0
scatter3(x0(1),x0(2),x0(3),'filled')
hold on
fx=@(x,y,z)0.8*x+z;
fy=@(x,y,z)0.4*y;
fz=@(x,y,z)2*z+x;
g0(1)=fx(x0(1),x0(2),x0(3));
g0(2)=fy(x0(1),x0(2),x0(3));
g0(3)=fz(x0(1),x0(2),x0(3));
f=@(x,y,z)0.4*x^2+0.2*y^2+z^2+x*z;
F=f(x0(1),x0(2),x0(3))
s0=-H0*g0;

kstar=[0.3942 2.5522 4.2203]+0*10^-4*[1 1 1];
X1=x0+kstar(1)*s0
F=f(X1(1),X1(2),X1(3));
d=f(X1(1),X1(2),X1(3))-f(x0(1),x0(2),x0(3));
%scatter(X1,'b','filled')
scatter3(X1(1),X1(2),X1(3),'filled')

while n<3
       
G1(1)=fx(X1(1),X1(2),X1(3));
G1(2)=fy(X1(1),X1(2),X1(3));
p1=G1-g0;
q1=X1-x0;
H1=H0-(H0*p1*p1.'*H0)/(p1.'*H0*p1)+(q1*q1.')/(p1.'*q1)
S1=-H1*G1;
X2=X1+kstar(n+1).*S1
F=f(X2(1),X2(2),X2(3));
d=f(X2(1),X2(2),X2(3))-f(X1(1),X1(2),X1(3));
%scatter(n+1,d,'b','filled')
scatter3(X2(1),X2(2),X2(3),'filled')
x0=X1;
g0=G1;
X1=X2;
H0=H1;
n=n+1;

if norm(X1-x0)<10^-6
    n=12;
end
end
G1(1)=fx(X1(1),X1(2),X1(3));
G1(2)=fy(X1(1),X1(2),X1(3));
p1=G1-g0;
q1=X1-x0;
H1=H0-(H0*p1*p1.'*H0)/(p1.'*H0*p1)+(q1*q1.')/(p1.'*q1)

xlabel('x')
ylabel('y')
zlabel('z')
hold off
