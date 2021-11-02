function X=normalize(X)
%标准化
 
 [n1,n2]=size(X);
 for j=1:n2
     a(j)=min(X(:,j)); 
     b(j)=max(X(:,j));
     %找出第j个属性的最小值和最大值
 
     for i=1:n1
         X(i,j)=(X(i,j)-a(j))/(b(j)-a(j));
     end
 end


    
    

