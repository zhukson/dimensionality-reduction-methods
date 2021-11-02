function [yale]=parameter(X,Y,R)
X=normalize(X);
yale=cell(5,6);
k=[2,4,6,8,10,12,14,16,18,20];
s=1;
 for i=1:5
     [V]=jisuanV(R,X,Y,k(i));
        for D=5:5:100
            [AC,VAC]=five_fold(V,X,Y,R,D);
            ACC(D,:)=AC;
            VACC(D,:)=VAC;
            D
        end
             yale{s,1}=k(i);
             yale{s,2}=ACC;
             yale{s,3}=VACC;
             yale{s,4}=max(ACC);
             a=find(ACC==yale{s,4});
             yale{s,5}=VACC(a,:);
             yale{s,6}=a;
             s=s+1;
 end
end
