function [ c ] = kernelPerceptronClassify( XTrain, XTest, w, d )

% filler code - replace with your code
nTest = size(XTest,1);
nTrain = size(XTrain,1);
c = ones(nTest,1);

XTrainT = XTrain';

for i = 1:nTest
	Xi = XTest(i,:);
	result = (Xi*XTrainT).^d * w;
	c(i,1) = sign(result);
end

end

