function [ c ] = perceptronClassify( XTest, w)

%filler code - replace with your code
c = ones(size(XTest,1),1);

for i = 1:size(XTest,1)
	Xi = XTest(i,:);
	yi_predicted = (Xi*w<0)*-2 +1;
	c(i,1) = yi_predicted;
end

end

