function [ sumX ] = logSum( X )

% filler code - replace with your code
sumX = 0;

pi_max = max(X);
sumX = log( sum(e.^(X-pi_max*ones(size(X)))) )+pi_max;

end

