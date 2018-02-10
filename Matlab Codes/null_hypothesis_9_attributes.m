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
area = [];

for qq = 1:100
    id2 = randperm(dim(2));
    for t = 0:.05:1
        
        idx = randperm(dim(1));
        
        num = num(idx,:);
        x = x(idx,:);
        
        Xtrain = num(1:100, id2(1:9));
        Ytrain = x(1:100);
        
        Xtest = num(101:200, id2(1:9));
        Ytest = x(101:200);
        
        model = perceptron_train(Xtrain, Ytrain);
        Pred_lr = perceptron_test_threshold(model, Xtest, t);
        
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
        
        precision(ix) = tp/(tp+fp);
        recall(ix) = tp/(tp+fn);
        accuracy(ix) = (tp+tn)/(tp+tn+fp+fn);
        
        ix = ix+1;
    end
    
    ix = 1;
    
    st=[1 mean(1-precision(1:20)') 1]; L=[0 0 0]; U=[1 1 1];
    fo_ = fitoptions('method','NonlinearLeastSquares','Lower',L,'Upper',U);
    ft_ = fittype('1-1/((1+(x/C)^B)^E)',...
        'dependent',{'y'},'independent',{'x'},...
        'coefficients',{'B', 'C', 'E'});
    cfit = fit(1-precision(1:20)',recall(1:20)',ft_,fo_);
    
    area(qq) = trapz(0:.01:1, cfit(0:.01:1));
    
    clear('cfit');
    
end
