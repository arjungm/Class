nTrain = size(XTrain,1);

all_words = cell(1,nTrain);
for i=1:nTrain
    all_words{i} = cell2mat(cellfun(@(x)[x ' '],XTrain{i}','UniformOutput',false));
end
all_words = cell2mat(all_words);