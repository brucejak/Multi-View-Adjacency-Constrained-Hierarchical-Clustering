function [finlabel,finDM,MMI,mlabels] = MCHC(X,K)
%MTC_MAIN Summary of this function goes here
%   Detailed explanation goes here
nv = size(X,2);

datanum = size(X{1},1);

DM = cell(1,(1+nv));

sum_DM = zeros(datanum,datanum);

for i=1:1:nv
    DM{i} = pdist2(X{i},X{i},'cosine');
    sum_DM = sum_DM+DM{i};
end

DM{(1+nv)} = (1/nv)*sum_DM;

mlabels = zeros(datanum, (1+nv));
MMI = zeros(1, (1+nv));

for i=1:1:(1+nv)
    cl = CNNC(DM{i},(K-1));
    mlabels(:,i) = cl;
    MMI(i) = Inter_Intra2(cl,DM{i});
    %MMI(i) = CVNN(cl,DM{i},10);
end

maxloc = find(MMI==max(MMI));

finlabel = mlabels(:,maxloc(1));

finDM = DM{maxloc(1)};

end

