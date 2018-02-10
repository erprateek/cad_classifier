function w = lr_train(Xtrain, Ytrain)
    dim = size(Xtrain);
    w = zeros(1, dim(2));
    a = 0.0003;
    lam = 0.00001;
    
    oldfun = 0;
    newfun = lcl(Xtrain, Ytrain, w) - lam*sum(w.*w);
        
    while( abs(newfun - oldfun) > .0001)
        oldfun = newfun;
        idx = randperm(dim(1));
        Xtrain = Xtrain(idx,:);
        Ytrain = Ytrain(idx,:);
        
        for i = 1:dim(1)
            p = 1/(1+exp(-1*sum(Xtrain(i,:).*w)));
            w = w + a*((Ytrain(i) - p)*Xtrain(i,:) - 2*lam*w);
        end
        
        newfun = lcl(Xtrain, Ytrain, w) - lam*sum(w.*w);
    end
end

            
        