[num,text,all] = xlsread('A-24');

m = all(:,2);
n = m(2:length(m));

for i = 1:length(n)
    if (n{i} == 'P')
        x(i,:) = 1;
    else
        x(i,:) = 0;
    end
end

dim = size(num);
idx = randperm(dim(1));
num = num(idx,:);
x = x(idx,:);

Xtrain = num(1:100,:);
Ytrain = x(1:100);

Xtest = num(101:200,:);
Ytest = x(101:200);

model = svmtrain(Xtrain, Ytrain);
Pred_lr = svmclassify(model, Xtest);

tp = 0;
tn = 0;
fp = 0;
fn = 0;

for i = 1:size(Ytest)
    if (Pred_lr(i) == 1 && Ytest(i) == 1)
        tp = tp + 1;
    elseif (Pred_lr(i) == 1 && Ytest(i) == 0)
        fp = fp + 1;
    elseif (Pred_lr(i) == 0 && Ytest(i) == 1)
        fn = fn + 1;
    elseif (Pred_lr(i) == 0 && Ytest(i) == 0)
        tn = tn + 1;
    end
end
tn
fp
%tn+fp
fn
%tp+fn

precision = tp/(tp+fp);
recall = tp/(tp+fn);
accuracy = (tp+tn)/(tp+tn+fp+fn);

fprintf('P:%.3f, R:%.3f, A:%.3f', precision, recall, accuracy);




