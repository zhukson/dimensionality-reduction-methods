function [e] =KNN(in,test,k)
% in:       training samples data
% test:     testing data
% target:   k-nearist neighbors given by knn
% k:        the number of neighbors
    dist=zeros(size(test,1),1);
for i=1:size(test,1)
     dist(i)=norm(in-test(i,:),2);
end   
    [sdist,index]=sort(dist);
     e=index(2:k+1);