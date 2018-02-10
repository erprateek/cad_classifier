function res = lcl(Xtrain, Ytrain, w)
    p = 1./(1+exp(-1*Xtrain*transpose(w)));
    
    res  = sum((log(p).*Ytrain) + (log(1-p).*(1-Ytrain)));
    
end
    