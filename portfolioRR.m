function [Ret Risk] = portfolioRR(S,w)
for i = 1:501
    data = S(i).data;
    idx = find(data(:,1)>=20160000);
    R1(i) = data(idx(1),7)/data(idx(end)+1,7)-1;%(今年/去年)-1
    DR(i,:) = (data(idx,7)./data(idx+1,7)-1)';
end
Ret = w*R1';
Risk = std(w*DR);