function [ D ] = knn( XTrain, XTest,k )

% filler code - replace with your code
nTrain = size(XTrain,1);
nTest = size(XTest,1);
D = ones(nTest,k);

distance_matrix = zeros(nTest,nTrain);
for i=1:nTrain
for j=1:nTest
distance_matrix(j,i)=(sum((XTrain(i,:)-XTest(j,:)).^2));
end
end

[sorted_distance_matrix, sorted_column_idx] = sort(distance_matrix,2,'ascend');

D = sorted_column_idx(:,1:k);

end

