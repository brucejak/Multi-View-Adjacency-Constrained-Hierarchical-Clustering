function [Cdist] = ps2psdist(Loc_dataset1,Loc_dataset2,DM)
%PS2PSDIST_DM Summary of this function goes here %%just using dist matrix
%without recalculate the distance.
%���£�����Ҫ�ظ�����DM��ֱ�ӰѲ���Ҫ�ľ����ÿ�
%   Detailed explanation goes here
%if numel(Loc_dataset1)==1&&numel(Loc_dataset2)==1
    %Cdist=DM(Loc_dataset1,Loc_dataset2);
%else
    %datanum=size(DM,1);
   % all_loc=1:1:datanum;
   % diff_Loc1=setdiff(all_loc, Loc_dataset1);
   % diff_Loc2=setdiff(all_loc, Loc_dataset2);
   % dists=DM;
%dists(diff_Loc1,:)=[];
%dists(:,diff_Loc2)=[];
dists=DM(Loc_dataset1,Loc_dataset2);
%Cdist=mean(mean(dists));%%���ƽ������
%Cdist=mean([num1 num2])*mean(mean(dists));
%Cdist=min(min(dists));%%�������̾���
Cdist=min(min(dists));
%Cdist=norm(mean(dataset1)-mean(dataset2));
%end
end

