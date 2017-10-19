function C=conjgate(X)
        g=gradient_f(X)';
        d=-g;
        H=hessian_f(X);
        C=[X;g];
        %for i=1:100;
        while((abs(g(1)-0)>=0.1)||(abs(g(2)-0)>=0.1))
            %alpha=(d'*H*d)\(d'*d)   %if f is not a quadratic function , 
                                     % it may divergence , because f is
                                     % unlike quadratic model which we
                                     % build
            alpha=backtracking(X,d);
            X=X+alpha*d;
            g=gradient_f(X)';
            
            C=[C [X;g]];
            H=hessian_f(X);
            betla=(d'*H*d)\(d'*H*g);
            d=-g+betla*d;
        end
    end