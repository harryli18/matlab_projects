k=linspace(-10,10,100)
phi=(x1+k*sx1)+(y1+k*sy1)+(x1+k*sx1).^2/4-(y1+k*sy1).^2+((y1+k*sy1).^2-(x1+k*sx1)/2).^2;
    plot(k,phi)
    