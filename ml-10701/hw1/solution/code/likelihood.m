function [ mu, sigma ] = likelihood( X, y )

% filler code - replace with your code
numFeat = size(X,2);
numClass = max(y);
mu = zeros(numFeat,numClass);
sigma = zeros(numFeat,numClass);

mu_transpose=[];
sigma_transpose=[];

for yi=1:numClass
mask_ytrain = (y~=yi);%selects indices for deletion (not of class i)
X_masked = X;%copies the training data
X_masked(mask_ytrain,:)=[];%deletes the non-matching rows
mu_col = mean(X_masked,1);%get the means of features for class i
var_col = var(X_masked);%get the variances of the features for class i
mu_transpose = [mu_transpose; mu_col];
sigma_transpose =[ sigma_transpose; var_col];
end

mu = mu_transpose';
sigma = sigma_transpose';
end

