function [ w ] = kernelWeights( XTrain, yTrain, nIter, d )

% filler code - replace with your code
nTrain = size(XTrain,1);
w = zeros(nTrain,1);

XTrainT = XTrain';

f = 0;
iter = 1;

while(iter <= nIter)
	for i=1:nTrain
		Xi = XTrain(i,:);
		yi = yTrain(i,:);
		result = (Xi*XTrainT).^d * w;
		if(yi*result <= 0)
			w(i,1) = w(i,1) + yi;
		end
	end
	iter = iter+1;
end

end

