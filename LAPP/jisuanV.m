function [V]=jisuanV(R,X,Y,k,d)
%l=size(R,2);    
for i=1:5
    indices1=find(R(:,i)==1);%%%%%%%%—µ¡∑ºØ
    indices2=find(R(:,i)==2);%%%%%%%%≤‚ ‘ºØ
    Xtrain=X(indices1,:);
    Xtest=X(indices2,:);
    Ytrain=Y(indices1,:);
    Ytest=Y(indices2,:);
    [V{i}]=Repeat(Xtrain,k,d);   
end
end