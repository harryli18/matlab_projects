n=2;
m=1000;
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