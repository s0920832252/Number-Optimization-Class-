%  (BFGS Method).
% Given starting point x0, convergence tolerance e > 0,
% inverse Hessian approximation H0;
% k �� 0;
% while  fk > e	;
% Compute search direction
% pk = Hk\fk ; 
% Set xk+1 = xk + �\k * pk where �\k is computed from a line search
% procedure to satisfy the Wolfe conditions 
% Define sk = xk+1 - xk and yk = fk+1 - fk ;
% Compute (Hk+1^-1) = (I - �lk * sk * (yk)' )*(Hk^-1)*(I - �lk * yk *sk')+�lk*sk*sk'
%                 �lk = 1/( yk' * sk) 
% k �� k + 1;
% end (while)
   
function B=BFGS(X)
        g=gradient_f(X)';    %delat f(Xi)
        B=[X;g];             %�_�l�I �N �[�J�^�ǵ��G
        B_H=eye(length(X))^-1;    %�ۦ�w�q H �� identity matrix �}�l�ܤ�
                                  %��s�覡�����_�o��s��H^-1 
        I=eye(length(X));                 %�w�q I �� ���x�}
     
        while((abs(g(1)-0)>=0.01)||(abs(g(2)-0)>=0.01))
            d=-(B_H*g);                                      %���Pnewton method �ۦPdirection  
            alpha=backtracking(X,d);                         %�ϥ�backtracking ���oalpha
            S=(X+alpha*d)-X;                                 % sk = xk+1 - xk 
            Y=gradient_f(X+alpha*d)'-gradient_f(X)';         % yk =fk+1 - fk = H*S
            rho=1/(Y'*S);                                    %�lk = 1/( yk' * sk)
            B_H=(I-rho*S*Y')*B_H*(I-rho*Y*S')+rho*S*S';      %update H ���F�U�@���� d ���ǳ�
            X=X+alpha*d;                                     %���� x=x+alpha*d   
            g=gradient_f(X)';                                %�p����I g
            B=[B [X;g]];
        end
end