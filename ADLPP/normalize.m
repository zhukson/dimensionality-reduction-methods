function X=normalize(X)
%��׼��
 
 [n1,n2]=size(X);
 for j=1:n2
     a(j)=min(X(:,j)); 
     b(j)=max(X(:,j));
     %�ҳ���j�����Ե���Сֵ�����ֵ
 
     for i=1:n1
         X(i,j)=(X(i,j)-a(j))/(b(j)-a(j));
     end
 end


    
    

