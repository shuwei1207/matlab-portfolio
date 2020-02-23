function out = YFDownload(tick)
url = sprintf('http://chart.finance.yahoo.com/table.csv?s=%s&g=d&ignore=.csv',tick);
filename = sprintf('%s.csv',tick);
urlwrite(url,filename);
[N,T,R]=xlsread(filename);
num = size(N,1);%�x�}�j�p
out = zeros(num,7);
out(:,2:7) = N;%��Ʀr��b��2~7��
for i = 1 : num
    date1 = R{i+1,1};%�Ĥ@row�����D�A���L
    tmp = sscanf(date1,'%d/%d/%d');
    out(i,1) = tmp(1)*10000+tmp(2)*100+tmp(3);%���ন�Ʀr���ɶ���b��1��
end