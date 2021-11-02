function [V1]=LPP(Xtrain,k)
%����Ȩ�ؾ���S,��ǩL
n=size(Xtrain,1);
m=size(Xtrain,2);
[W]=quanzhong(Xtrain,k);
D=diag(sum(W,2));
L=D-W;
Sd=Xtrain'*D*Xtrain;
Sl=Xtrain'*L*Xtrain;
I=eye(m,m);
T=(I/(Sd))*Sl;
[V1,SS1]=eig(T+T');
SS1=diag(SS1);
[disc_value1,index1]=sort(SS1);  %���ذ������е�S����Ӧ���±�
V1=V1(:,index1);   %����������������ֵ��������
V1=real(V1);
end
    
        
    
