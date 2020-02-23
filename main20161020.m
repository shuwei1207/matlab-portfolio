W=rand(100000,501)
for i = 1 : 100000
    w = W(i,:);
    w = w/sum(w);
    [Ret Risk]=portfolioRR(S,w);
    X(i) = Ret;
    Y(i) = Risk;
end
plot(X,Y,'.');