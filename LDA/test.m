function [oa,aa,rr]=test(V1,D,Xtrain,Xtest,Ytrain,Ytest)
X1=Xtrain;
Y1=Ytrain;
dtrain=X1*V1;
dtest=Xtest*V1;
dtr=dtrain(:,1:D);
dte=dtest(:,1:D);
%%%%%%%%%%%%%%%%%%%
Mdl=fitcknn(dtr,Y1);
label=predict(Mdl,dte);
%����OA�������׼ȷ��
n=size(dte,1);
oa=sum(Ytest==label)/n;
%����ÿ��׼ȷ��
c=max(Ytest);
ac=zeros(c,1);
rc=zeros(c,1);
for i=1:c
    s=find(Ytest==i);
    r=find(label==i);%%%%%�ٻ���
    Ytest1=Ytest(s,:);
    Yte1=label(s,:);
    ac(i)=sum(Ytest1==Yte1)/size(s,1);
    q=size(r,1);
    if q==0
        rc(i)=0;
    else
    rc(i)=sum(Ytest1==Yte1)/size(r,1);%%%%%�ٻ���
    end
end
aa=mean(ac);
rr=mean(rc);
end


        
    