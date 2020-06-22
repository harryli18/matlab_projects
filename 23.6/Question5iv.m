X1=0.02;
Xn=2;
m=100;
dX=2/m;
X=zeros(m,1);
X(1)=dX;
for i=2:m
    X(i)=X(i-1)+dX;
end
dtau=0.0001;
n=(0.52/dtau);
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
    
     xlabel('r')
ylabel('angular momentum/surface density') 
    plot (sigma(:,10).*X)
hold on
plot (sigma(:,10))
legend('angluar momentum','surface density')

   
    