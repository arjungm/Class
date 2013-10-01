function [ mu, sigma ] = likelihood( X, y )

% filler code - replace with your code
numFeat = size(X,2);
numClass = max(y);
mu = zeros(numFeat,numClass);
sigma = zeros(numFeat,numClass);

end

