function ans = perceptron_train(Xtrain, Ytrain)
   
    dim = size(Xtrain);
    w1 = zeros(1, dim(2));
    k = 1;
    c = zeros(1,1);
    t = 0;
    
    Ytrain(Ytrain == 0) = -1;
    
    while(t<=100)
        for i = 1:dim(1)
            if (w1(k,:)* transpose(Xtrain(i,:))*Ytrain(i) <= 0)
                if (Ytrain(i)>0)
                    w1(k+1,:) = w1(k,:) + 2*Ytrain(i)*Xtrain(i,:);
                else
                    w1(k+1,:) = w1(k,:) + 0.5*Ytrain(i)*Xtrain(i,:);
                end
                
                c(k+1,:) = 1;
                k = k+1;
            else
                c(k) = c(k) + 1;
            end
        end
        t = t + 1;
    end
    
    ans = {w1,c};
end

                
                
        
    