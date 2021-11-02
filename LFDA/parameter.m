function [yale6]=parameter(X,Y,R)
yale6=cell(1,15);
%X=normalize(X);
[V]=jisuanV(R,X,Y);
i=1;
      for D=5:5:100
            [cOa,cAc,cRc,vOa,vAc,vRc]=five_fold(V,R,D,X,Y);
            OA(i,:)=cOa;
            VOA(i,:)=vOa;
            AA(i,:)=cAc;
            VAA(i,:)=vAc;
            RA(i,:)=cRc;
            VRA(i,:)=vRc;
            i=i+1;
      end
             %%%%%%%%%%%%%%%%%%整体OA准确率
             yale6{1,1}=OA;
             yale6{1,2}=VOA;
             yale6{1,3}=max(OA);
             a=find(OA==yale6{1,3});
             yale6{1,4}=VOA(a,:);
             yale6{1,5}=a;
             %%%%%%%%%%%%%%%%%%%每类AA平均准确率
             yale6{1,6}=AA;
             yale6{1,7}=VAA;
             yale6{1,8}=max(AA);
             b=find(AA==yale6{1,8});
             yale6{1,9}=VAA(b,:);
             yale6{1,10}=b;
             %%%%%%%%%%%%%%%%%%%平均RA召回率
             yale6{1,11}=RA;
             yale6{1,12}=VRA;
             yale6{1,13}=max(RA);
             c=find(RA==yale6{1,13});
             yale6{1,14}=VRA(c,:);
             yale6{1,15}=c;
 %save FEREATpc5
end
