dX=2/100;
m=100;
dtau=0.0001;
n=(0.52/dtau);
X=zeros(m,n+1);
X(1,1)=dX;
for i=2:m
    X(i,1)=X(i-1,1)+dX;
end
f=zeros(m,n+1);
g=zeros(m,n+1);
for i=1:m
        g(i,1)=log(3*sigma(i,1)*X(i,1));
        f(i,1)=-3/(4*X(i,1).^2);
end

for j=1:n+1
    for i=1:m-j
        if sigma(i,j)<(10^-40)
            X(i,j+1)=0;
        else
           X(i,j+1)=X(i,j)+(dtau/dX)*f(i,j)*(g(i+1,j)-g(i,j));
        f(i,j+1)= -3/(4*(X(i,j+1).^2));
        g(i,j+1)=log(3*sigma(i,j+1)*X(i,j+1));
        end
    end
end
v=zeros(m,n+1);
for j=1:n
   for i=1:m
    v(i,j)=(X(i,j+1)^2-X(i,j)^2)/dtau;
   end
end
 xlabel('r')
ylabel('surface density/radial volcity')
title('tau=0,0.002,0.008,0.032,0.128,0.512')
   hold on

    plot(X(:,3).^2,v(:,3),'g')
    plot(X(:,9).^2,v(:,9),'r')
    plot(X(:,33).^2,v(:,33),'g')
    plot(X(:,129).^2,v(:,129),'r')
    plot(X(:,513).^2,v(:,513),'g')
    hold off 


   
    