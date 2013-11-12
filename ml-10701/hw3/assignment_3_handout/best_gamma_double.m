close all
gamma = [1 5 10 50 100 500 1000 5000 10000];
best_acc = 0;

Y1 = Y(1:1000);
Y2 = Y(1001:end);
data1 = data(1:1000,:);
data2 = data(1001:end,:);

for i = 1:length(gamma)
N_bound = 100;

%make the folds
acc_mean1 = 0;
acc_mean2 = 0;
for k = 1:10
    test_range = 100*(k-1)+(1:100);
    train_range = 1:1000;
    train_range(test_range) = [];
    
    model1 = svmtrain(Y1(train_range), data1(train_range,:), ['-t 2 -g ' num2str(gamma(i))]);
    model2 = svmtrain(Y2(train_range), data2(train_range,:), ['-t 2 -g ' num2str(gamma(i))]);
    
    [pred acc dec_val]=svmpredict(Y1(test_range) , data1(test_range,:) , model1);
    acc_mean1 = acc + acc_mean1;
    [pred acc dec_val]=svmpredict(Y2(test_range) , data2(test_range,:) , model2);
    acc_mean2 = acc + acc_mean2;
end
acc_mean1 = acc_mean1 / 10;
acc_mean2 = acc_mean2 / 10;

acc_mean = (acc_mean1 + acc_mean2)/2;
if(best_acc < acc_mean(1))
    best_acc = acc_mean(1);
    best_gam = gamma(i);
end

end

disp(best_acc);

%Not okay, because you picked your gamma knowing the test set.