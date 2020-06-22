n=1;
x0=zeros(2,1);
g0=zeros(2,1);
s0=zeros(2,1);
H0=eye(2);
X1=zeros(2,1);
X2=zeros(2,1);
G1=zeros(2,1);
S1=zeros(2,1);
H1=zeros(2,2);
p1=zeros(2,1);
q1=zeros(2,1);
x0(1)=0.676;
x0(2)=0.443;
fx=@(x,y)-2*(1-x)-320*x*(y-x^2);
fy=@(x,y)160*(y-x^2);
g0(1)=fx(x0(1),x0(2));
g0(2)=fy(x0(1),x0(2));
f=@(x,y)(1-x)^2+80*((y-x^2)^2);
s0=-H0*g0;

%plot(x0)

phi=@(k)(1-(x0(1)+k*s0(1)))^2+80*((x0(2)+k*s0(2))-(x0(1)+k*s0(1))^2)^2;
kstar=fminbnd(phi,-10,10);
X1=x0+kstar*s0;
F=f(X1(1),X1(2));
d=f(X1(1),X1(2))-f(x0(1),x0(2));
scatter(n,X1(1),'filled')
scatter(n,X1(2))
hold on
%plot(X1)

while n<500
    
G1(1)=fx(X1(1),X1(2));
G1(2)=fy(X1(1),X1(2));
p1=G1-g0;
q1=X1-x0;
H1=H0-(H0*p1*p1.'*H0)/(p1.'*H0*p1)+(q1*q1.')/(p1.'*q1)
S1=-H1*G1;
phi=@(k)(1-(X1(1)+k*S1(1)))^2+80*((X1(2)+k*S1(2))-(X1(1)+k*S1(1))^2)^2;
kstar=fminbnd(phi,-10,10);
X2=X1+kstar.*S1;
F=f(X2(1),X2(2));
d=f(X2(1),X2(2))-f(X1(1),X1(2));
scatter(n+1,X2(1),'filled')
scatter(n+1,X2(2))

%plot(X2)
x0=X1;
g0=G1;
X1=X2;
H0=H1;
n=n+1;

if norm(X1-x0)<10^-8
    n=2500;
end
end
xlabel('x')
ylabel('y')
legend('y','x')
hold off 