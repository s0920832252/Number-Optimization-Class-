% i can't understand what is the difference between write 1 and 2

% function [ alpha ] = backtracking(xk,pk,f,gradient_f)    % ---1
  function [ alpha ] = backtracking(xk,pk)               %---2

% Algorithm  (Backtracking Line Search).
% Choose �£\ > 0, �l ? (0, 1), c ? (0, 1); Set �\ �� �£\;
% repeat until f (xk + �\pk) <= f (xk) + c*�\*f *pk
% �\ �� �l�\;
% end (repeat)
% Terminate with �\k  �\.

alpha=1;  %�_�l�B�� pk�V�j->alpha*pk �V�j,�]��alpha���@�w�ȧY�i.
          %���i��ؼжZ���_�l�I�ܻ�,�ݭnalpha*pk�ܤj(alpha>1)�~�i��F
          
c=0.1;  %�Ѯv���� [0.1 0.3]  �V�p���gradient�u�V���Ӥ��P, �V���� , �Y�i�����̤j�B�Ƨ�h,���_�l�I�V��.
B=0.7;  % alpha update rate ����[0.1 0.8]

%---1
%   while(feval('f',(xk+alpha*pk))>feval('f',xk)+c*alpha*feval('gradient_f',xk)*pk)
%          alpha=alpha*B;
%   end
 
%---2
 while(f(xk+alpha*pk)>f(xk)+c*alpha*gradient_f(xk)*pk)
        alpha=alpha*B ;  
 end

end

