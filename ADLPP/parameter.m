function [usps9]=parameter(X,Y,R)
%X=normalize(X);
usps9=cell(5,16);
k=[2,4,6,8,10];
s=1;
for m=1:5
    i=1;
    for D=5:5:100
        tic;
        disp(['--------------------------------------Iter=',num2str(s),'-----------------------------------------'])
        disp(['--------------------------------------k=',num2str(k(m)),'--------------------------------------------'])
        disp(['--------------------------------------dimension=',num2str(D),'------------------------------------'])
        [V]=jisuanV(R,X,Y,k(m),D);
        [cOa,cAc,cRc,vOa,vAc,vRc]=five_fold(V,R,D,X,Y);
        OA(D,:)=cOa;
        VOA(D,:)=vOa;
        AA(D,:)=cAc;
        VAA(D,:)=vAc;
        RA(D,:)=cRc;
        VRA(D,:)=vRc;
        i=i+1;
    end
    usps9{s,1}=k(m);
    %%%%%%%%%%%%%%%%%%整体OA准确率
    usps9{s,2}=OA; %整体平均准确率
    usps9{s,3}=VOA; %整体准确率标准差
    usps9{s,4}=max(OA); %整体最大准确率
    a=find(OA==usps9{s,4}); 
    usps9{s,5}=VOA(a,:);
    usps9{s,6}=a;%当准确率最大时的dimension
    %%%%%%%%%%%%%%%%%%%每类AA平均准确率
    usps9{s,7}=AA; %每类分类平均准确率
    usps9{s,8}=VAA;  %每类分类标准差
    usps9{s,9}=max(AA); %每类分类最大准确率
    b=find(AA==usps9{s,9}); 
    usps9{s,10}=VAA(b,:); %准确率最大时的标准差
    usps9{s,11}=b;%准确率最大时的dimension
    %%%%%%%%%%%%%%%%%%%平均RA召回率
    usps9{s,12}=RA; %平均召回率
    usps9{s,13}=VRA; %召回率标准差
    usps9{s,14}=max(RA); %最大召回率
    c=find(RA==usps9{s,14}); 
    usps9{s,15}=VRA(c,:); %最大召回率时候的标准差
    usps9{s,16}=c; %最大召回率时候的dimension
    s=s+1;
    toc;
end
%save fac6
end

