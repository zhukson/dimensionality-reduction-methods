function [oa,aa,rr]=test(V1,D,Xtrain,Xtest,Ytrain,Ytest)
X1=Xtrain;
Y1=Ytrain;
dtrain=X1*V1;
dtest=Xtest*V1;
dtr=dtrain(:,1:D);
dte=dtest(:,1:D);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% n=size(dte,1);
% m=size(dtr,1);
% dist=zeros(m,1);
% Yte=zeros(n,1);
% for i=1:n
%     for j=1:m
%         dist(j)=norm(dte(i,:)-dtr(j,:));
%     end
%     a1=find(dist==min(dist));
%     Yte(i)=Ytrain(a1,:);
% end
%����OA�������׼ȷ��
Mdl=fitcknn(dtr,Y1);
label=predict(Mdl,dte);
n=size(Ytest,1);
oa=sum(label==Ytest)/n;

%����AAÿ��׼ȷ�ʺ�RA�ٻ���
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
    rc(i)=sum(Ytest1==Yte1)/q;%%%%%�ٻ���
    end
end
aa=mean(ac);
rr=mean(rc);
end



        
    