dX=2/100;
m=100;
X=zeros(m,1);
X(1)=dX;
for i=2:m
    X(i)=X(i-1)+dX;
end
dtau=0.0001;
n=(1/dtau);
sigma=zeros(m,n+1);
f=zeros(m,n+1);
g=zeros(m,n+1);
for i=1:m
sigma(i,1)=exp(-((X(i)-1)^2)/0.001);
end
for i=1:m
        g(i,1)=3*sigma(i,1)*X(i);
        f(i,1)=4*(X(i)^3)*sigma(i,1);
end
for j=1:n+1
    for i=j+1:m-j
        f(i,j+1)=f(i,j)+(dtau/(dX^2))*(g(i+1,j)-2*g(i,j)+g(i-1,j));
        sigma(i,j+1)=f(i,j+1)/(4*X(i)^3);
        g(i,j+1)=3*sigma(i,j+1)*X(i);
    end
end

clear m n X f g dX dtau

dX=2/100;
m=100;
dtau=0.0001;
n=(1/dtau);
X=zeros(m,n+1);
X(1,1)=dX;
for i=2:m
    X(i,1)=X(i-1,1)+dX;
end
f=zeros(m,n+1);
g=zeros(m,n+1);
for i=1:m
        g(i,1)=3*sigma(i,1)*X(i,1);
        f(i,1)=4*(X(i,1)^3)*sigma(i,1);
end

for j=1:n+1
    for i=1:m-j
        if f(i,j)<(10^-4)
            X(i,j+1)=0;
        else
        X(i,j+1)=X(i,j)-(dtau/dX)*(1/f(i,j))*(g(i+1,j)-g(i,j));
        f(i,j+1)=4*(X(i,j+1)^3)*sigma(i,j+1);
        g(i,j+1)=3*sigma(i,j+1)*X(i,j+1);
        end
    end
end

tau=zeros(1,n+1);
tau(1,1)=0;
for i=2:n+1
    tau(1,i)=tau(1,i-1)+dtau;
end

N=zeros(5,1);
for i=1:5
    N(i)=0.85+i*0.05
end

k1=find(X(round(sqrt(0.9)/dX),1:80)<0.02);
k2=find(X(round(sqrt(0.9)/dX),1:80)<0.02);
k3=find(X(round(sqrt(0.9)/dX),1:80)<0.02);
k4=find(X(round(sqrt(0.9)/dX),1:80)<0.02);
k5=find(X(round(sqrt(0.9)/dX),1:80)<0.02);
k=zeros(5,1);
k(1)=k1(1);
k(2)=k2(1);
k(3)=k3(1);
k(4)=k4(1);
k(5)=k5(1);

plot(N,k*dtau)
xlabel('r0')
ylabel('tau(time it takes to reach a boundary')
ylim([0,0.01])
