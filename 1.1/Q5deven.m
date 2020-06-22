tic
%FFT
n=0;
m=5200;
X=50/pi;
x=linspace(0,X,m/2);
k=linspace(-X,X,m);
J2hat=zeros(m,1);
J=besselj(n,x);
J(1)=(besselj(n,0)+besselj(n,1/pi))/2;
J1hat=(fft(J));
for j=1:m/2
J2hat(j)=real(J1hat(j));
J2hat(m-j+1)=real(J1hat(j));
end


%Jhat (theoritical) 
k=linspace(-X,X,m);
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

E=zeros(m,1);
for j=1:m
    E(j)=Jthat(j)-J2hat(j);
end

plot(k,abs(E))
ylabel('Error')
toc