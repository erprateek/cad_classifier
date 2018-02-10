function pred = perceptron_test_threshold(model, Xtest, t)
    
    w1 = model{1};
    c = model{2};
      
    M = Xtest*transpose(w1);
    M = sign(M);
    
    pred = M*c;
    pred = pred + abs(min(pred));
    
    pred(pred < t*max(pred)) = 0;
    pred(pred >= t*max(pred)) = 1;
    
end
