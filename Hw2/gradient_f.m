 % X is input vector 
 % f is target function
 % the ( function-gradient ) can make a gradient vector and return it
 % ps: user must know , if you want know your f' on mutiva ,you can assign a d vector
 %    , and then ,  f' = d*(the function return_value) , it is the Define
 %     example f'(x1,x2) = [g1,g2] * [delta_f/delta_x1 delta_f/delta_x2]=d*gradient
 
 %function v = gradient_f(X,f)  %---1
 function v = gradient_f(X)   %---2
   %the function use  limit( h->0 )  ( f(x+hd)-f(x) )/h to do gradient
   h=0.0001; % move h  delta

%----1
%      for i=1:length(X)
%          newX=X;
%          newX(i)=X(i)+h;
%          v(i)=(feval('f',newX)-feval('f',X))/h;
%      end   
   
%----2
   for i=1:length(X)
       newX=X;
       newX(i)=X(i)+h;        %���i�Ӱ����ܶq�L��(f(x+h)-f(x))/h ��L�ܼƩT�w
       v(i)=(f(newX)-f(X))/h;
   end

 
end

%�����Ѫ��ɶ� �񥴵{���[...�����...