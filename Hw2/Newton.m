function N=Newton(X)
        g=gradient_f(X)'; %delat f(Xi)
        N=[X;g];          %起始點 將 加入回傳結果
               
        while((abs(g(1)-0)>=0.1)||(abs(g(2)-0)>=0.1))%~isequal(round(g,3),[0;0]))  %abs(g-[0;0])<0.01
            H=hessian_f(X);              %計算hessian matrix
            d=-(H\g);                    %運算 方向d
            X=X+d;                       %移動 x=x+d
            g=gradient_f(X)';            %計算該點 g
            N=[N [X;g]];                 % 加入回傳結果
        end            
end