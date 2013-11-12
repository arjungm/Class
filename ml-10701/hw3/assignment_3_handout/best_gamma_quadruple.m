close all
gamma = [1 5 10 50 100 500 1000 5000 10000];
best_acc1 = 0;
best_acc2 = 0;

Y1 = Y(1:1000);
Y2 = Y(1001:end);
data1 = data(1:1000,:);
data2 = data(1001:end,:);

for i = 1:length(gamma)
N_bound = 100;

%make the folds
acc_mean1 = 0;
acc_mean2 = 0;

%acc for gamma on 1
for k = 1:10
    test_range = 100*(k-1)+(1:100);
    train_range = 1:1000;
    train_range(test_range) = [];
    
    model1 = svmtrain(Y1(train_range), data1(train_range,:), ['-t 2 -g ' num2str(gamma(i))]);
    
    [pred acc dec_val]=svmpredict(Y1(test_range) , data1(test_range,:) , model1);
    acc_mean1 = acc + acc_mean1;
end
acc_mean1 = acc_mean1 / 10;

%acc for gamma on 2
for k = 1:10
    test_range = 100*(k-1)+(1:100);
    train_range = 1:1000;
    train_range(test_range) = [];
    
    model2 = svmtrain(Y2(train_range), data2(train_range,:), ['-t 2 -g ' num2str(gamma(i))]);
    
    [pred acc dec_val]=svmpredict(Y2(test_range) , data2(test_range,:) , model2);
    acc_mean2 = acc + acc_mean2;
end
acc_mean2 = acc_mean2 / 10;

if(best_acc1 < acc_mean1(1))
    best_acc1 = acc_mean1(1);
    best_model1 = model1;
    best_gam1 = gamma(i);
end
if(best_acc2 < acc_mean2(1))
    best_acc2 = acc_mean2(1);
    best_model2 = model2;
    best_gam2 = gamma(i);
end

end

[pred E1 dec_val] = svmpredict(Y2 , data2 , best_model1);
[pred E2 dec_val] = svmpredict(Y1 , data1 , best_model2);
E= (E1+E2)/2;
disp(E);

%gammas do not match
%I trust 2CV more
