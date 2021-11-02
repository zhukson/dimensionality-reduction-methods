function [A]=Repeat(Xtrain,Ytrain,k,d)
S0=quanzhong(Xtrain,k);
[H]=labels(Ytrain);
S0=S0.*H;
[A0]=LPP(Xtrain,S0);
%%
T=20;
for i=1:T
    X0=Xtrain*A0(:,1:d);
    [S]=quanzhong(X0,k);
    S=S.*H;
    [A]=LPP(Xtrain,S);
    C=max(max(abs(A-A0)));
    if C<=0.001
        break
    else
        A0=A;
    end
end
end