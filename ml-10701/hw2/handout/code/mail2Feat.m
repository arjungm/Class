function [ Feats ] = mail2Feat( Mail )

% THE FOLLOWING IS A VERY SIMPLE EXAMPLE SHOWING ONE POSSIBLE WAY TO
% COLLECT FEATURES. PLEASE REPLACE WITH YOUR CODE. NOTE HOW YOU CAN PLACE 
% PRE-PROCESSED RESULTS IN dictionary.csv.


% load data from dictionary.csv file
fid = fopen('dictionary.csv');    
tline = fgetl(fid);
dict = lower(strread(tline,'%s','delimiter',','));

nMail = size(Mail,1);
nFeat = length(dict);

% set up the feature matrix.
Feats = [zeros(nMail,nFeat),ones(nMail,5)]; 

struct_array = struct();
for i = 1:nFeat
   key = genvarname(dict{i});
   struct_array.(key) = i;
end

% collect features
for i = 1:nMail
    mu = Mail{i};
    m = lower(Mail{i});
    
    if mod(i,100)==1 
        disp(i)
    end

    nWords = length(m);
    chars = cell2mat(m');
    charsU = cell2mat(mu');
    for k = 1:length(m)
        test_key = m{k};
        if isfield(struct_array, test_key)
           ind = struct_array.(test_key);
           Feats(i, ind) = 1;
        end
    end
    %latter features
    Feats(i,length(dict)+1) = nWords;
    Feats(i,length(dict)+2) = length(regexp(chars,'www'));
    Feats(i,length(dict)+3) = length(regexp(chars,'[a-z]\d[a-z]'));
    Feats(i,length(dict)+4) = length(regexp(chars,'[a-z][^\w. ][a-z]'));
end
maxFeats= max(Feats,[],1);
maxFeats(maxFeats <= 0) = 1;
for i=1:size(Feats,2)
    Feats(:,i) = Feats(:,i) ./ maxFeats(i);
end
disp('Feats')
disp(size(Feats));
end