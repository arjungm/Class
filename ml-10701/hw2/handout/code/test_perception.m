w=weightsP(XTrain, yTrain,10000);
c = perceptronClassify( XTrain, w);
sum(yTrain == c) / size(yTrain,1)