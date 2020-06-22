n=2;
m=10000;
x=linspace(0,1/pi,m/2);
k=linspace(-1/pi,1/pi,m);
J2hat=zeros(m,1);
J=besselj(n,x);
J(1)=(besselj(n,0)+besselj(n,1/pi))/2;
J1hat=(fft(J));
for j=1:m/2
J2hat(j)=real(J1hat(j));
J2hat(m-j+1)=real(J1hat(j));
end
plot(k,abs(J2hat));
xlabel('k')
ylabel('Jhat')
legend('n=2')



