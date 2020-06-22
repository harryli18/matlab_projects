tic
n=0;
m=1000000;
X=300/pi;
x=linspace(0,X,m/2);
k=linspace(-X,X,m);
J2hat=zeros(m,1);
J=besselj(n,x);
J(1)=(besselj(n,0)+besselj(n,1/pi))/2;
J1hat=(fft(J));
for j=1:m/2
J2hat(j)=imag(J1hat(j));
J2hat(m-j+1)=imag(J1hat(j));
end
plot(k,abs(J2hat));
xlabel('k')
ylabel('Jhat')
legend('n=1')
toc



