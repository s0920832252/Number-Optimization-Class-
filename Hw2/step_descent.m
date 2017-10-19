 function S=step_descent(X)
        g=gradient_f(X)';    %delat f(Xi)
        S=[X;g];             %�_�l�I �N �[�J�^�ǵ��G
        h=0.0001;            %liimt h -> 0 
        while((abs(g(1)-0)>=0.1)||(abs(g(2)-0)>=0.1))  
            d=-g;                                         %��V�� g���Ϥ�V
            %Hd= ((gradient_f(X+h*d)-gradient_f(X))/h)';  %�ϥΤG���ҫ����oalpha  ����H  �����p��Hd limit h->0 (f(x+h)'-f(x)')/h 
            %X=X+((d'*Hd)\(d'*d))*d;                      % alpha = (d'Hd)\(d'd) so X=X+(alpha)d
            
            alpha=backtracking(X,d);                      %�ϥ�backtracking ���oalpha
            X=X+alpha*d;                                  %���� x=x+alpha*d   
            
            g=gradient_f(X)';                             %�p����I g
            S=[S [X;g]];                                  % �[�J�^�ǵ��G
        end
end