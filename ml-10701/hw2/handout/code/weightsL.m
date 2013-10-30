function [ w ] = weightsL( XTrain, yTrain )

%filler code - replace with your code
nTrain = size(XTrain,1);
nFeat = size(XTrain,2);
w = zeros(size(nFeat,1));

w = inverse(XTrain'*XTrain) * XTrain' * yTrain;

end

