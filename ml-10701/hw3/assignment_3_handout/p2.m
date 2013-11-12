close all
gamma = [1 10 100 1000 10000];
for i = 1:length(gamma)
figure
N_bound = 100;

hold on; plot(data(Y==1,1),data(Y==1,2),'bo'); plot(data(Y==0,1),data(Y==0,2),'rx');
model1 = svmtrain(Y, data, ['-t 2 -g ' num2str(gamma(i))]);
[x1 x2] = meshgrid( linspace(min(data(:,1)),max(data(:,1)),N_bound), linspace(min(data(:,2)),max(data(:,2)),N_bound) );

x1 = reshape(x1, numel(x1), 1);
x2 = reshape(x2, numel(x2), 1);

X = [x1 x2];
[pred acc dec_val]=svmpredict(zeros(size(X,1),1), X, model1);       

x1=reshape(x1,N_bound,N_bound);
x2=reshape(x2,N_bound,N_bound);
pred=reshape(pred,N_bound,N_bound);

dec=reshape(dec_val,N_bound,N_bound);

[C h] = contour(x1, x2, dec,[-1 0 1],'LineWidth',2);

colorize
plot(model1.SVs(:,1),model1.SVs(:,2),'ko','MarkerSize',10);
end