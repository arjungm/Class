close all
gamma = [1 10 100 1000 10000];
best_acc = 0;
err = [];
for i = 1:length(gamma)
N_bound = 100;

%make the folds
acc_mean = 0;
train_err = 0;
test_err = 0;
for k = 1:10
    test_range = 200*(k-1)+(1:200);
    train_range = 1:2000;
    train_range(test_range) = [];
    
    model = svmtrain(Y(train_range), data(train_range,:), ['-t 2 -g ' num2str(gamma(i))]);
    
    [pred acc dec_val]=svmpredict(Y(train_range) , data(train_range,:) , model);
    train_err = train_err + sum(pred~=Y(train_range))/length(train_range);
    
    [pred acc dec_val]=svmpredict(Y(test_range) , data(test_range,:) , model);
    test_err = test_err + sum(pred~=Y(test_range))/length(test_range);
    
    acc_mean = acc + acc_mean;
end
acc_mean = acc_mean / 10;
train_err = train_err / 10;
test_err = test_err / 10;

err = [err [train_err test_err]'];

if(best_acc < acc_mean(1))
    best_acc = acc_mean(1);
    best_gam = gamma(i);
    best_test = test_err;
    best_train = train_err;
end

end

plot(log(gamma)/log(10), err(1,:), log(gamma)/log(10), err(2,:));
xlabel('log(gamma)')
ylabel('error')
legend('training', 'testing')

disp(best_gam);

%Not okay, because you picked your gamma knowing the test set.

% 0.0162 train 0.0630 test