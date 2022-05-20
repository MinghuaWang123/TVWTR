%�˳��������������������ź���Ĺ��׽�
%[msad,SAD] = mSAD(A_true,A_es)
%Input: 
%A_true     Ϊ��ʵ�ģ��ź���Ķ�Ԫ���׾���
%A_es       Ϊ���Ƶģ�����ʵ��Ԫ���׾���һһ��Ӧ�Ĺ��ƶ�Ԫ����
%Output��
%masd       Ϊ���׽�ƽ�����
%SAD        Ϊÿ�����ߵ�����

function [msad,SAD] = mSAD(A_true,A_es)


[~,p] = size(A_true);

SAD = zeros(1,p);

for i = 1:p
    x = A_true(:,i);
    y = A_es(:,i);
    SAD(i) = acos( x'*y/(norm(x)*norm(y)) )*180/pi;
end

% msad = norm(SAD,'fro')/p;
msad = mean(SAD);

end
