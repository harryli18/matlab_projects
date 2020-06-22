%Solve Euler's Equation numercailly 
n=1;
A=1.5;
B=1;
C=0.5;
t0=0;
tn=10;
%step size h
step=0.1;
U0=1;
V0=1;
W0=1;
m=(tn-t0)/step;
f=@(t,V,W)((B-C)*V*W/A);
g=@(t,U,W)((C-A)*W*U/B);
h=@(t,U,V)((A-B)*U*V/C);
w1=zeros(1,m);
w2=zeros(2,m);
w3=zeros(1,m);
t=zeros(1,m);
E=0.5*A*U0^2+0.5*B*V0^2+0.5*C*W0^2;
H=sqrt(A^2*U0^2+B^2*V0^2+C^2*W0^2);
display([E,H^2])

%4-stage explicit RK methods 
while n<m+1
    t1=t0+step;
    a1=f(t0,V0,W0);
    b1=g(t0,U0,W0);
    c1=h(t0,U0,V0);
   
    a2=f(t0+0.5*step,V0+0.5*step*b1,W0+0.5*step*c1);
    b2=g(t0+0.5*step,U0+0.5*step*a1,W0+0.5*step*c1);
    c2=h(t0+0.5*step,U0+0.5*step*a1,V0+0.5*step*b1);
    
    a3=f(t0+0.5*step,V0+0.5*step*b2,W0+0.5*step*c2);
    b3=g(t0+0.5*step,U0+0.5*step*a2,W0+0.5*step*c2);
    c3=h(t0+0.5*step,U0+0.5*step*a2,V0+0.5*step*b2);
    
    a4=f(t0+step,V0+step*b3,W0+step*c3);
    b4=g(t0+step,U0+step*a3,W0+step*c3);
    c4=h(t0+step,U0+step*a3,V0+step*b3);
    
    U1=U0+step*(a1/6+a2/3+a3/3+a4/6);
    V1=V0+step*(b1/6+b2/3+b3/3+b4/6);
    W1=W0+step*(c1/6+c2/3+c3/3+c4/6);
    t(n)=t1;
    w1(n)=U1;
    w2(n)=V1;
    w3(n)=W1;
    plot3(w1,w2,w3)
xlabel('w1')
ylabel('w2')
zlabel('w3')

t0=t1;
U0=U1;
V0=V1;
W0=W1;
n=n+1;
end
   
E=0.5*A*U1^2+0.5*B*V1^2+0.5*C*W1^2;
H=sqrt(A^2*U1^2+B^2*V1^2+C^2*W1^2);
display([E,H^2])

  