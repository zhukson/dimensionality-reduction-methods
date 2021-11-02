function [AC,VAC]=five_fold(V,X,Y,R,D)
l=size(R,2);
for i=1:5
    indices1=find(R(:,i)==1);
    indices2=find(R(:,i)~=1);
    Xtest=X(indices1,:);
    Xtrain=X(indices2,:);
    Ytest=Y(indices1,:);
    Ytrain=Y(indices2,:);
    ac(i,1)=test(V{i},D,Xtrain,Xtest,Ytrain,Ytest);
end
AC=mean(ac);VAC=std(ac);
end

    
    
    

