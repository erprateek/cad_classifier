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
precision = [];
recall = [];
accuracy = [];
ix = 1;



idx = randperm(dim(1));
num = num(idx,:);
x = x(idx,:);

Xtrain = num(1:200,:);
Ytrain = x(1:200);

er = 1-CV_lr_P_only(Xtrain, Ytrain);
er2 = 1-CV_perceptron_P_only(Xtrain, Ytrain);

y  = er-er2;
ymean = mean(y);

k = 4;

Sk = sqrt(((y - ymean)*(y - ymean)')/(k-1));
t = ymean*sqrt(k)/Sk;

p_value = 2*min(tcdf(t, k-1), 1-tcdf(t, k-1));
 
