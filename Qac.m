function [ind] = Qac(sort_p)
%IND_DEC_1 �˴���ʾ�йش˺�����ժҪ �����������������������
%   �˴���ʾ��ϸ˵��
p_num=numel(sort_p);
ind_num=p_num-1;
ind=zeros(1,ind_num);
for i=1:1:ind_num
    ind(i)=sort_p(i)/sort_p(i+1);
end
ind(p_num)=NaN;
end

