function [AC,NM,AR,RI,F] = ClusteringEST(conclulabels,datalabels)
%CLUSTEINGEST �˴���ʾ�йش˺�����ժҪ ���������ĸ�ָ�꣺AC,AR,RI,F-measure
%   �˴���ʾ��ϸ˵��
AC=(accuracy(datalabels,conclulabels))/100;
[PR,RE,AR,RI,~,~]=Pre_Rec(conclulabels,datalabels);
F=(2*PR*RE)/(PR+RE);
NM = nmi(conclulabels,datalabels);
end

