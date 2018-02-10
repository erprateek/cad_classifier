function g = perceptron_run(Xtrain, Ytrain, Xtest, Ytest)
        
    model = perceptron_train(Xtrain, Ytrain);
    Pred_per = perceptron_test(model, Xtest);
    
    tp = 0;
    tn = 0;
    fp = 0;
    fn = 0;
    
    for i = 1:size(Ytest)
        if (Pred_per(i) == 1 && Ytest(i) == 1)
            tp = tp + 1;
        elseif (Pred_per(i) == 1 && Ytest(i) == 0)
            fp = fp + 1;
        elseif (Pred_per(i) == 0 && Ytest(i) == 1)
            fn = fn + 1;
        elseif (Pred_per(i) == 0 && Ytest(i) == 0)
            tn = tn + 1;
        end
    end
    
    precision = tp/(tp+fp);
    recall = tp/(tp+fn);
    accuracy = (tp+tn)/(tp+tn+fp+fn);
    
    save Pred_per.mat Pred_per;
    fprintf('P:%.3f, R:%.3f, A:%.3f', precision, recall, accuracy);
end