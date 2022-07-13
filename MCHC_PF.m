function [cls] = MCHC_PF(X,isfig)
%MTC_MAIN Summary of this function goes here
%   Detailed explanation goes here
nv = size(X,2);

datanum = size(X{1},1);

%DM = cell(1,(1+nv));

sum_DM = zeros(datanum,datanum);

for i=1:1:nv
    DM = pdist2(X{i},X{i},'cosine');
    sum_DM = sum_DM+DM;
end

DM_star = (1/nv)*sum_DM;

%figure();
cls = CNNC_PF(DM_star,isfig);

end

