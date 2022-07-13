function [I, I3, I4, DM1] = Inter_Intra2(Idx,DM)
%INTER_INTRA 此处显示有关此函数的摘要
%   此处显示详细说明，相对于初始版本，不对距离矩阵进行归一化
%   将平均距离改为最短距离
for i=1:1:size(DM,1)
    DM(i,i)=0;
end


%PDM = squareform(DM);
%norm_PDM = mapminmax(PDM,0,1);
%DM1 = squareform(norm_PDM);
DM1 = DM;

uni_Idx = unique(Idx);
uni_num = numel(uni_Idx);
community = cell(1,uni_num);
for i=1:1:uni_num
    community{i}=find(Idx==uni_Idx(i));
end


interdist = zeros(uni_num, uni_num);

for i=1:1:uni_num
    for j=1:1:uni_num
        interdist(i,j) = ps2psdist(community{i},community{j},DM1);
    end
end

for i=1:1:uni_num
    interdist(i,i) = 0;
end

Pinterdist = squareform(interdist);
%sort_interdist = sort(interdist,2);

I3 = min(Pinterdist);
%I3 = mean(sort_interdist(:,2));

intradist_class = zeros(1,uni_num);
%for i=1:1:uni_num
    %DM_class = DM1(community{i},community{i});
    %for j=1:1:numel(community{i})
        %DM_class(j,j) = -inf;
    %end
    %sort_DMclass = sort(DM_class,2);
    %intradist_class(i) = mean(sort_DMclass(:,2));
%end

for i=1:1:uni_num
    if numel(community{i})==1
        intradist_class(i)=0;
        continue
    end
    DM_class = DM1(community{i},community{i});
    for j=1:1:numel(community{i})
        DM_class(j,j) = 0;
    end
    PDM_class = squareform(DM_class);
    intradist_class(i) = mean(PDM_class);
end


I4 = max(intradist_class);

I = I3/I4;
end

