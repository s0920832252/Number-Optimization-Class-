 function S=step_descent(X)
        g=gradient_f(X)';    %delat f(Xi)
        S=[X;g];             %起始點 將 加入回傳結果
        h=0.0001;            %liimt h -> 0 
        while((abs(g(1)-0)>=0.1)||(abs(g(2)-0)>=0.1))  
            d=-g;                                         %方向取 g的反方向
            %Hd= ((gradient_f(X+h*d)-gradient_f(X))/h)';  %使用二次模型取得alpha  不算H  直接計算Hd limit h->0 (f(x+h)'-f(x)')/h 
            %X=X+((d'*Hd)\(d'*d))*d;                      % alpha = (d'Hd)\(d'd) so X=X+(alpha)d
            
            alpha=backtracking(X,d);                      %使用backtracking 取得alpha
            X=X+alpha*d;                                  %移動 x=x+alpha*d   
            
            g=gradient_f(X)';                             %計算該點 g
            S=[S [X;g]];                                  % 加入回傳結果
        end
end