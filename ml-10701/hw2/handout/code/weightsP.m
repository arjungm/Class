function [ w ] = weightsP( XTrain, yTrain, nIter)

%filler code - replace with your code
nTrain = size(XTrain,1);
nFeat = size(XTrain,2);
w = zeros(nFeat,1);

iteration_number = 1;

while(iteration_number<=nIter)
	for i = 1:nTrain
		Xi = XTrain(i,:);%index by row
		yi = yTrain(i);

		f =sign(Xi*w);
		%update rule
		if(yi!=f)
			w = w+yi*Xi';
		end
	end
	iteration_number = iteration_number + 1;
end