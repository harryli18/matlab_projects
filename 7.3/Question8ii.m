G=zeros(2,2);
x=1;
y=1;
G(1,1)=2-320*(y-x^2)+640*x^2;
G(1,2)=-320*x;
G(2,1)=-320*x;
G(2,2)=160;
H=inv(G)

