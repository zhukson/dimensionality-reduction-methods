function [ac]=test(V1,D,Xtrain,Xtest,Ytrain,Ytest)
X1=Xtrain;
Y1=Ytrain;
dtrain=X1*V1;
dtest=Xtest*V1;
dtr=dtrain(:,1:D);
dte=dtest(:,1:D);
%%
Mdl=fitcknn(dtr,Y1);
label=predict(Mdl,dte);
n=size(Ytest,1);
ac=sum(label==Ytest)/n;
end


        
    