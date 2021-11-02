function [W]=quanzhong(Xtrain,k)
n=size(Xtrain,1);
W=zeros(n,n);
d=zeros(n,1);
for i=1:n
    [e] =KNN(Xtrain(i,:),Xtrain,7);
    d(i)=norm(Xtrain(i,:)-Xtrain(e(7),:));
end
for i=1:n
    [e] =KNN(Xtrain(i,:),Xtrain,k);
    for j=1:k
        W(i,e(j))=exp(-(norm(Xtrain(i,:)-Xtrain(e(j),:))^2)/(d(i)*d(j)));
    end
end
for i=1:n
    for  j=1:n
         if  W(i,j)==0&&W(j,i)~=0
             W(i,j)=W(j,i);
         end
     end
end
    