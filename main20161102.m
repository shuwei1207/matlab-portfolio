load SP500;
idx1 = find(S(1).data(:,1)>=20150101);
idx2 = find(S(1).data(:,1)<=20151231);
idx = intersect(idx1,idx2);
kill = [];
for i = 2 : 505
    idx1 = find(S(i).data(:,1)>=20150101);
    idx2 = find(S(i).data(:,1)<=20151231);
    idx3 = intersect(idx1,idx2);
    if(~isequal(idx,idx3))
        kill = [kill i];%�R���ѼƤ��������q
    end
end
S(kill) = [];
S(373) = [];
for i = 1 : length(S)
    DR(i,:) = (S(i).data(idx,7)./S(i).data(idx+1,7))'-1;%�ন���i�h
end
mDR = DR - repmat(mean(DR')',[1 length(idx)]);%DR�������A�ƻs��1*length(idx)
DRcov = mDR*mDR'/(length(idx)-1);
A = repmat(std(DR'),[length(S) 1]);%��зǮt
Rho = DRcov./A./A';%Rho=�@�ܲ�XY/(X�зǮt*Y�зǮt)