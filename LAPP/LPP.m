function [V1]=LPP(Xtrain,W)
%计算权重矩阵S,标签L
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
[~,index1]=sort(SS1,'ascend');  %返回按照排列的S及对应的下标
V1=V1(:,index1);   %特征向量按照特征值降序排列
V1=real(V1);
end
    
        
    
