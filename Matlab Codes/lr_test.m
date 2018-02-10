function res  = lr_test(model, Xtest, t)
    res  = 1./(1+exp(-1*Xtest*transpose(model)));
    res(res < t) = 0;
    res(res >= t) = 1;
end
