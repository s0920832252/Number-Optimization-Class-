%  (BFGS Method).
% Given starting point x0, convergence tolerance e > 0,
% inverse Hessian approximation H0;
% k ← 0;
% while  fk > e	;
% Compute search direction
% pk = Hk\fk ; 
% Set xk+1 = xk + αk * pk where αk is computed from a line search
% procedure to satisfy the Wolfe conditions 
% Define sk = xk+1 - xk and yk = fk+1 - fk ;
% Compute (Hk+1^-1) = (I - ρk * sk * (yk)' )*(Hk^-1)*(I - ρk * yk *sk')+ρk*sk*sk'
%                 ρk = 1/( yk' * sk) 
% k ← k + 1;
% end (while)
   
function B=BFGS(X)
        g=gradient_f(X)';    %delat f(Xi)
        B=[X;g];             %起始點 將 加入回傳結果
        B_H=eye(length(X))^-1;    %自行定義 H 由 identity matrix 開始變化
                                  %更新方式為不斷得到新的H^-1 
        I=eye(length(X));                 %定義 I 為 單位矩陣
     
        while((abs(g(1)-0)>=0.01)||(abs(g(2)-0)>=0.01))
            d=-(B_H*g);                                      %取與newton method 相同direction  
            alpha=backtracking(X,d);                         %使用backtracking 取得alpha
            S=(X+alpha*d)-X;                                 % sk = xk+1 - xk 
            Y=gradient_f(X+alpha*d)'-gradient_f(X)';         % yk =fk+1 - fk = H*S
            rho=1/(Y'*S);                                    %ρk = 1/( yk' * sk)
            B_H=(I-rho*S*Y')*B_H*(I-rho*Y*S')+rho*S*S';      %update H 為了下一次取 d 做準備
            X=X+alpha*d;                                     %移動 x=x+alpha*d   
            g=gradient_f(X)';                                %計算該點 g
            B=[B [X;g]];
        end
end