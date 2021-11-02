function [cOa,cAc,cRc,vOa,vAc,vRc]=five_fold(X,Y,R,D)
for i=1:5
    indices1=find(R(:,i)==1);
    indices2=find(R(:,i)==2);
    Xtest=X(indices1,:);
    Xtrain=X(indices2,:);
    Ytest=Y(indices1,:);
    Ytrain=Y(indices2,:);
    [V1]=LDA(Xtrain,Ytrain);
    [oa,aa,rr]=test(V1,D,Xtrain,Xtest,Ytrain,Ytest);
    Oa(i,:)=oa;Ac(i,:)=aa;Rc(i,:)=rr;
end
cOa=mean(Oa);vOa=std(Oa);
cAc=mean(Ac);vAc=std(Ac);
cRc=mean(Rc);vRc=std(Rc);
end

    
    

