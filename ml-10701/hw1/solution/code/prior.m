function [ probs ] = prior( y )

%filler code - replace with your code
numC = max(y);
probs = ones(numC,1)/numC;

for c=1:numC
probs(c,1) = sum(y==c);
end
probs = probs./length(y);
end

