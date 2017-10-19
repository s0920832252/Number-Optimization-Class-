% i can't understand what is the difference between write 1 and 2

% function [ alpha ] = backtracking(xk,pk,f,gradient_f)    % ---1
  function [ alpha ] = backtracking(xk,pk)               %---2

% Algorithm  (Backtracking Line Search).
% Choose ¯α > 0, ρ ? (0, 1), c ? (0, 1); Set α ← ¯α;
% repeat until f (xk + αpk) <= f (xk) + c*α*f *pk
% α ← ρα;
% end (repeat)
% Terminate with αk  α.

alpha=1;  %起始步數 pk越大->alpha*pk 越大,因此alpha為一定值即可.
          %有可能目標距離起始點很遠,需要alpha*pk很大(alpha>1)才可到達
          
c=0.1;  %老師推薦 [0.1 0.3]  越小表示gradient線越跟原來不同, 越平滑 , 即可走的最大步數更多,離起始點越遠.
B=0.7;  % alpha update rate 推薦[0.1 0.8]

%---1
%   while(feval('f',(xk+alpha*pk))>feval('f',xk)+c*alpha*feval('gradient_f',xk)*pk)
%          alpha=alpha*B;
%   end
 
%---2
 while(f(xk+alpha*pk)>f(xk)+c*alpha*gradient_f(xk)*pk)
        alpha=alpha*B ;  
 end

end

