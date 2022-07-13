function [eachlayerlabel,mass,R,cutlinkpower_all] = CNNC_PF(ALL_DM,isfig)
% input: ALL_DM: distance matrix of n x n, where n means the number of total data samples;
%       NAB(number of abnormal connections): 
%                 when NAB=0, exploit the automatic mode to determine the number of clusters;
%                 when NAB¡Ù0£¬remove the top NAB connections with the largest torque to obtain the clusters.                       
% output: Idx: final clusters labels;
%         cutnum: number of abnormal connections that are removed when exploiting the automatic mode.
%¼ò»¯ÐÞ¸ÄÎªmult-view clustering
datanum=size(ALL_DM,1);cutlinkpower_all=[];eachlayerlabel=[];
ljmat=sparse(datanum,datanum);
%community=cell(1,datanum);
dataloc=1:1:datanum;
%for i=1:1:datanum
%community{1,i}=i;
%end
community=arrayfun(@(x) {dataloc(x)},1:length(dataloc));
commu_DM=ALL_DM;
%commu_DM1=commu_DM;
community_num=datanum;
% i=1:1:community_num
%commu_DM1(i,i)=NaN;
%end

G=sparse(community_num,community_num);
%for i=1:1:community_num
%gd=find(commu_DM1(i,:)==min(commu_DM1(i,:)));
   
        %G(i,gd(1))=1;
        %G(gd(1),i)=1;
%end
[~,Order]=sort(commu_DM,2);
neiborloc=cell(1,community_num);
for i=1:1:community_num
    G(i,Order(i,2))=1;
    G(Order(i,2),i)=1;
    neiborloc{1,i}=Order(i,2);
end
SG=graph(G);
BINS = conncomp(SG);
%linklocCell=[];
%[a,b,~]=find(G);
%for i=1:1:community_num
%neiborloc{1,i}=b(a==i)';
%end
cur_NC=numel(unique(BINS));
disp(['The number of clusters in this layer is: ',num2str(cur_NC)])
[ljmat,cutlinkpower]=Updateljmat(ljmat,neiborloc,community,commu_DM,G,ALL_DM);
[cutlinkpower,ljmat]=uniqueZ(cutlinkpower,ljmat);
%firstlayer_conn_num=size(cutlinkpower,1);
cutlinkpower_all=[cutlinkpower_all;cutlinkpower];

ljmat_layerG = graph(ljmat);
BINS_layer = conncomp(ljmat_layerG);
eachlayerlabel=[eachlayerlabel BINS_layer'];


while 1
Idx=BINS;uni_Idx=unique(Idx);
num_uni_Idx=length(uni_Idx);

community_new=cell(1,num_uni_Idx);
for i=1:1:num_uni_Idx
uniloc=(uni_Idx(i)==Idx);
community_new{1,i}=[community{uniloc}];
end
community=community_new;
community_num=size(community,2);
%commu_DM=[];
commu_DM=zeros(community_num,community_num);
%linklocCell=cell(community_num,community_num);
for i=1:1:community_num
for j=1:1:community_num
commu_DM(i,j)=ps2psdist(community{1,i},community{1,j},ALL_DM);
end
end
%commu_DM1=commu_DM;
%for i=1:1:community_num
%commu_DM1(i,i)=NaN;
%end
for i=1:1:community_num
commu_DM(i,i)=-inf;
end


G=sparse(community_num,community_num);
%Order=[];
[~,Order]=sort(commu_DM,2);
neiborloc=cell(1,community_num);
for i=1:1:community_num
%gd=find(commu_DM1(i,:)==min(commu_DM1(i,:)));
    if numel(community{i})<=numel(community{Order(i,2)})
        G(i,Order(i,2))=1;
        G(Order(i,2),i)=1;
        neiborloc{1,i}=Order(i,2);
    end  
end
SG=graph(G);
BINS = conncomp(SG);

%[a,b,~]=find(G);
%for i=1:1:community_num
%neiborloc{1,i}=b(a==i)';
%end
%numel(unique(BINS))
cur_NC=numel(unique(BINS));
disp(['The number of clusters in this layer is: ',num2str(cur_NC)])

[ljmat,cutlinkpower]=Updateljmat(ljmat,neiborloc,community,commu_DM,G,ALL_DM);
[cutlinkpower,ljmat]=uniqueZ(cutlinkpower,ljmat);
cutlinkpower_all=[cutlinkpower_all;cutlinkpower];

ljmat_layerG = graph(ljmat);
BINS_layer = conncomp(ljmat_layerG);
eachlayerlabel=[eachlayerlabel BINS_layer'];

if numel(unique(BINS))==1
break
end
end
mass=cutlinkpower_all(:,5).*cutlinkpower_all(:,6);
R=cutlinkpower_all(:,7).^2;

%p=mass.*R;


%[~,order]=sort(p,'descend');%loc=1:numel(p);
%[~,order_2]=sort(order);%%
%firstlayer_loc_onsortp=order_2(1:firstlayer_conn_num);

%if NAB==0
%cutnum =Nab_dec(p,mass,R,firstlayer_loc_onsortp);
    %cutlink=cutlinkpower_all(order(1:cutnum),:);
     %xx=cutlink;
    %cutlink(:,[1 2 5 6 7])=[];
%end
%else
if isfig==1
    subplot(2,1,1)
plot(R(:),mass(:),'o','MarkerSize',5,'MarkerFaceColor','k','MarkerEdgeColor','k');
title ('Decision Graph','FontSize',15.0)
xlabel ('D')
ylabel ('M')
end


    %cutnum = NAB;
    %cutlink=cutlinkpower_all(order(1:cutnum),:);
   
    %cutlink(:,[1 2 5 6 7])=[];
%end

%cutlinknum=size(cutlink,1);
%for i=1:1:cutlinknum
%ljmat(cutlink(i,1),cutlink(i,2))=0;
%ljmat(cutlink(i,2),cutlink(i,1))=0;
%end
%ljmat_G=graph(ljmat);
%BINS = conncomp(ljmat_G);
%Idx=BINS';
%NC=numel(unique(BINS));
end
