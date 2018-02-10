function pred = perceptron_test(model, Xtest)
    
    w1 = model{1};
    c = model{2};
      
    M = Xtest*transpose(w1);
    M = sign(M);
    
    pred = sign(M*c);
    pred(pred == -1) = 0;
end
