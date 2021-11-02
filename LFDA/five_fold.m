function [cOa,cAc,cRc,vOa,vAc,vRc]=five_fold(V,R,D,X,Y)
ac=zeros(5,1);
for i=1:5
    indices1=find(R(:,i)==1);
    indices2=find(R(:,i)~=1);
    Xtest=X(indices1,:);
    Xtrain=X(indices2,:);
    Ytest=Y(indices1,:);
    Ytrain=Y(indices2,:);
    %[V1]=LFDA(Xtrain,Ytrain);
    [oa,aa,rr]=test(V{i},D,Xtrain,Xtest,Ytrain,Ytest);
    Oa(i,:)=oa;Ac(i,:)=aa;Rc(i,:)=rr;
end
cOa=mean(Oa);vOa=std(Oa);
cAc=mean(Ac);vAc=std(Ac);
cRc=mean(Rc);vRc=std(Rc);
end
    
    

