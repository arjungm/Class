load words.mat
load dict_assoc.mat
load full_words_assoc.mat

nWords = size(words,1);
histogram = hist(full_aa, nWords);