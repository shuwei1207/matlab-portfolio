idx = [];
for i = 1 : 505
if(length(find(S(i).data(:,1)>=20160000))~=209)
idx = [idx i];
end
end
S(idx)=[];