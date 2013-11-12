close all
gamma = [1 10 100 1000 10000];
best_acc = 0;
for i = 1:length(gamma)
N_bound = 100;

%make the folds
acc_mean = 0;
for k = 1:10
    test_range = 200*(k-1)+(1:200);
    train_range = 1:2000;
    train_range(test_range) = [];
    
    model = svmtrain(Y(train_range), data(train_range,:), ['-t 2 -g ' num2str(gamma(i))]);
    [pred acc dec_val]=svmpredict(Y(test_range) , data(test_range,:) , model);
    acc_mean = acc + acc_mean;
end
acc_mean = acc_mean / 10;

if(best_acc < acc_mean(1))
    best_acc = acc_mean(1);
    best_gam = gamma(i);
end

end

disp(best_gam);

%Not okay, because you picked your gamma knowing the test set.