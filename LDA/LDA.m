function [V1]=LDA(Xtrain,Ytrain)
%����Ȩ�ؾ���S,��ǩL
n=size(Xtrain,1);
m=size(Xtrain,2);
[Sw,Sb]=quanzhong(Xtrain,Ytrain);
I=eye(m,m);
T=pinv(Sw)*Sb;
[V1,SS1]=eig(T);
SS1=diag(SS1);
[disc_value1,index1]=sort(SS1,'descend');  %���ذ������е�S����Ӧ���±�
V1=V1(:,index1);   %����������������ֵ��������
V1=real(V1);
end
    
        
    
