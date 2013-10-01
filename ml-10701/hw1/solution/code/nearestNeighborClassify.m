function b = nearestNeighborClassify( XTrain, XTest, yTrain, k )

%filler code - replace with your code
nTest = size(XTest,1);
b = zeros(nTest,1);

neighbour_inds = knn(XTrain,XTest,k);
for i =1:nTest
neighbour_labels = yTrain(neighbour_inds(i,:));
b(i,1)=mode(neighbour_labels,1);
end

end

