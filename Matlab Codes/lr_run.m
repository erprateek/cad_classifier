function res = lr_run(Xtrain, Ytrain, Xtest, Ytest)
            
    model = lr_train(Xtrain, Ytrain);
    Pred_lr = lr_test(model, Xtest);
    
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
    
    precision = tp/(tp+fp);
    recall = tp/(tp+fn);
    accuracy = (tp+tn)/(tp+tn+fp+fn);
    
    save Pred_lr.mat Pred_lr;
    fprintf('P:%.3f, R:%.3f, A:%.3f', precision, recall, accuracy);
end