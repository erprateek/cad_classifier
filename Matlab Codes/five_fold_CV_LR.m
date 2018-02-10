[num,text,all] = xlsread('MS-9');

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
precision = [];
recall = [];
accuracy = [];
ix = 1;
acc = [];

for i = 1:5
    idx = randperm(dim(1));
    num = num(idx,:);
    x = x(idx,:);
    
    Xtrain = num(1:200,:);
    Ytrain = x(1:200);
    
    acc(i,:) = CV_lr_PRA(Xtrain, Ytrain);
end

res = mean(acc)

