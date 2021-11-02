function [Sw,Sb]=quanzhong(Xtrain,Ytrain)
n=size(Xtrain,1);
m=size(Xtrain,2);
c=max(Ytrain);
U=mean(Xtrain);
Uc=zeros(c,m);
Num=zeros(c,1);
for i=1:c
    indices=find(Ytrain==i);
    x=Xtrain(indices,:);
    Uc(i,:)=mean(x);
    Num(i)=size(x,1);
end
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%计算类内矩阵Sw
Sw=zeros(m,m);
for i=1:n
    x=Xtrain(i,:);
    u=Uc(Ytrain(i),:);
    sw=(x-u)'*(x-u);
    Sw=Sw+sw;
end
%计算类间Sb
Sb=zeros(m,m);
for i=1:c
    sb=Num(i)*(Uc(i,:)-U)'*(Uc(i,:)-U);
    Sb=Sb+sb;
end

    



    