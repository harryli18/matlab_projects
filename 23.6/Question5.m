X1=0.02;
Xn=2;
dX=2/100;
m=100;
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
[M0,I0]=max(sigma(:,1))
    [M1,I1]=max(sigma(:,3));
    hold on 
    [M2,I2]=max(sigma(:,9));
   [M3,I3]=max(sigma(:,33));
    [M4,I4]=max(sigma(:,129));
    [M5,I5]=max(sigma(:,513));
  
    hold off 
a=[M0^2,I0*dX;M1^2,I1*dX;M2^2,I2*dX;M3^2,I3*dX;M4^2,I4*dX;M5^2,I5*dX]
   
    