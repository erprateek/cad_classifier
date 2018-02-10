function res = CV_lr_P_only(Xtrain, Ytrain)
    
    fold = 5;
    h = size(Ytrain,1)/fold;
    m = 1:size(Ytrain,1);
    acc = [];
    prec = [];
    rec = [];
    
    dim = size(Xtrain);
       
    for i = 1:fold
        xtest = Xtrain(m/h > i-1 & m/h <= i,:);
        ytest = Ytrain(m/h > i-1 & m/h <= i,:);
        
        xtrain = Xtrain(m/h <= i-1 | m/h > i,:); 
        ytrain = Ytrain(m/h <= i-1 | m/h > i,:);
        
        model = lr_train(xtrain, ytrain);
        Pred_nb = lr_test(model, xtest, 0.25);
        
        tp = 0;
        tn = 0;
        fp = 0;
        fn = 0;
        
        for j = 1:size(ytest)
            if (Pred_nb(j) == 1 && ytest(j) == 1)
                tp = tp + 1;
            elseif (Pred_nb(j) == 1 && ytest(j) == 0)
                fp = fp + 1;
            elseif (Pred_nb(j) == 0 && ytest(j) == 1)
                fn = fn + 1;
            elseif (Pred_nb(j) == 0 && ytest(j) == 0)
                tn = tn + 1;
            end
        end
        
        acc(i) = (tp+tn)/(tp+tn+fp+fn);    
    end
    
    res = acc;
end
