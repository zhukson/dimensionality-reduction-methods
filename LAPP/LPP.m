function [V1]=LPP(Xtrain,W)
%����Ȩ�ؾ���S,��ǩL
n=size(Xtrain,1);
m=size(Xtrain,2);
%[W]=quanzhong(Xtrain,k);
D=diag(sum(W,2));
L=D-W;
Sd=Xtrain'*D*Xtrain;
Sl=Xtrain'*L*Xtrain;
I=eye(m,m);
T=(I/(Sd+0.0001*I))*Sl;
[V1,SS1]=eig((T+T')/2);
SS1=diag(SS1);
[~,index1]=sort(SS1,'ascend');  %���ذ������е�S����Ӧ���±�
V1=V1(:,index1);   %����������������ֵ��������
V1=real(V1);
end
    
        
    
