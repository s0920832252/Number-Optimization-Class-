function N=Newton(X)
        g=gradient_f(X)'; %delat f(Xi)
        N=[X;g];          %�_�l�I �N �[�J�^�ǵ��G
               
        while((abs(g(1)-0)>=0.1)||(abs(g(2)-0)>=0.1))%~isequal(round(g,3),[0;0]))  %abs(g-[0;0])<0.01
            H=hessian_f(X);              %�p��hessian matrix
            d=-(H\g);                    %�B�� ��Vd
            X=X+d;                       %���� x=x+d
            g=gradient_f(X)';            %�p����I g
            N=[N [X;g]];                 % �[�J�^�ǵ��G
        end            
end