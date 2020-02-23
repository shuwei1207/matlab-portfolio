[N T R]=xlsread('SP500.xlsx');
for i = 1 : length(T)
S(i).tick = T{i};
S(i).data = YFDownload(S(i).tick);
end
save SP500 S;
%load SP500