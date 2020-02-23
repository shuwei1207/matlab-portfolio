function out = MCOption(S0,mu,T,sigma,X,N,num)
S=zeros(N+1);
S(1)=S0;
dt=T/N;
for i=1:N
    S(i+1)=S(i)*exp((mu-0.5*sigma*sigma)*dt+randn(1)*sigma*sqrt(dt));
end
plot(S);