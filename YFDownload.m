function out = YFDownload(tick)
url = sprintf('http://chart.finance.yahoo.com/table.csv?s=%s&g=d&ignore=.csv',tick);
filename = sprintf('%s.csv',tick);
urlwrite(url,filename);
[N,T,R]=xlsread(filename);
num = size(N,1);%矩陣大小
out = zeros(num,7);
out(:,2:7) = N;%把數字放在第2~7行
for i = 1 : num
    date1 = R{i+1,1};%第一row為標題，跳過
    tmp = sscanf(date1,'%d/%d/%d');
    out(i,1) = tmp(1)*10000+tmp(2)*100+tmp(3);%把轉成數字的時間放在第1行
end