clear
disp('results on 100leaves dataset')
data=importdata('100leaves.mat');
for i=1:1:3
X{i}=data.data{i}';
end
datalabels=data.truelabel{1};
K=numel(unique(datalabels));
cl = MCHC(X,K);
[AC,NM,~,~,Fscore] = ClusteringEST(cl,datalabels+1)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
clear
disp('results on uci-digit dataset')
data=importdata('uci-digit.mat');
datalabels=data.truth;
X{1}=full(data.mfeat_fac);
X{2}=full(data.mfeat_fou);
X{3}=full(data.mfeat_kar);
K=numel(unique(datalabels));
cl = MCHC(X,K);
[AC,NM,~,~,Fscore] = ClusteringEST(cl,datalabels+1)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
clear
disp('results on COIL-20 dataset')
data=importdata('COIL20_mtv.mat');
datalabels=data.Y;
X=data.X;
K=numel(unique(datalabels));
cl = MCHC(X,K);
[AC,NM,~,~,Fscore] = ClusteringEST(cl,datalabels+1)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
clear
disp('results on handwritten dataset')
data=importdata('handwrittenRnsp.mat');
X{1} = data.X1; X{2} = data.X2;
datalabels=data.truth;
K=numel(unique(datalabels));
cl = MCHC(X,K);
[AC,NM,~,~,Fscore] = ClusteringEST(cl,datalabels+1)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
clear
disp('results on ORL dataset')
data=importdata('ORL_mtv.mat');
for i=1:1:3
X{i}=data.X{i}';
end
datalabels=data.gt;
K=numel(unique(datalabels));
cl = MCHC(X,K);
[AC,NM,~,~,Fscore] = ClusteringEST(cl,datalabels+1)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
clear
disp('results on Umist dataset')
data=importdata('Umist_mtv.mat');
X=data.data;
datalabels = data.gt;
K=numel(unique(datalabels));
cl = MCHC(X,K);
[AC,NM,~,~,Fscore] = ClusteringEST(cl,datalabels+1)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
clear
disp('results on CMU-PIE dataset')
data=importdata('CMU_mtv.mat');
X=data.data;
datalabels = data.gt;
K=numel(unique(datalabels));
cl = MCHC(X,K);
[AC,NM,~,~,Fscore] = ClusteringEST(cl,datalabels+1)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
clear
disp('results on COIL-100 dataset')
data=importdata('coil100mtv.mat');
X=data.data;
datalabels = data.gt;
K=numel(unique(datalabels));
cl = MCHC(X,K);
[AC,NM,~,~,Fscore] = ClusteringEST(cl,datalabels+1)