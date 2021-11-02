function [Sw,Sb]=quanzhong(Xtrain,Ytrain)
n=size(Xtrain,1);
m=size(Xtrain,2);
c=max(Ytrain);
Num=zeros(c,1);
Sw=zeros(m,m);
Sb=zeros(m,m);
for i=1:c
    indices=find(Ytrain==i);
    x=Xtrain(indices,:);
    Num(i)=size(x,1);
end
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%计算7近邻deta
deta=zeros(n,1);
for i=1:n
    x=Xtrain(i,:);
    [e] =KNN(x,Xtrain,7);
    y=Xtrain(e(7),:);
    deta(i)=norm(x-y);
end
%计算权重矩阵A
A=zeros(n,n);
for i=1:n
    for j=1:n
        A(i,j)=exp(-(norm(Xtrain(i,:)-Xtrain(j,:))^2)/(deta(i)*deta(j)));
    end
end        
%计算类内矩阵Sw
Ww=zeros(n,n);
Wb=zeros(n,n);
for i=1:n
    for j=1:n
        if Ytrain(i)==Ytrain(j)
            Ww(i,j)=A(i,j)/(Num(Ytrain(i)));
            Wb(i,j)=A(i,j)*(1/n-1/(Num(Ytrain(i))));
        else
            Ww(i,j)=0;
            Wb(i,j)=1/n;
        end
        Sb=Sb+Wb(i,j)*(Xtrain(i,:)-Xtrain(j,:))'*(Xtrain(i,:)-Xtrain(j,:));
        Sw=Sw+Ww(i,j)*(Xtrain(i,:)-Xtrain(j,:))'*(Xtrain(i,:)-Xtrain(j,:));
    end        
end
Sb=Sb/2;
Sw=Sw/2;




    



    