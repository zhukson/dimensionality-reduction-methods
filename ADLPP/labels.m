function [H]=labels(Y)
n=size(Y,1);
H=zeros(n,n);
for i=1:n
    for j=1:n
        if Y(i,:)==Y(j,:)
            H(i,j)=1;
        end
    end
end
end