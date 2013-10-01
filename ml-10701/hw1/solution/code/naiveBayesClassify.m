function [ b ] = naiveBayesClassify( XTrain, XTest, yTrain )

% filler code - replace with your code
nTest = size(XTest,1);
nClass = max(yTrain);
b = ones(nTest,1);

[ M, V ] = likelihood( XTrain, yTrain );
M=M'; V = V';

P=zeros(nTest,nClass);
for i=1:nTest
for j=1:nClass
P(i,j)=exp(sum( (-(XTest(i,:) - M(j,:)).^2)./(2*V(j,:))));
end
end

pri = ones(nTest,1)*prior( yTrain )';

pos = P.*pri;

[junk b] = max(pos');
b=b';

end



