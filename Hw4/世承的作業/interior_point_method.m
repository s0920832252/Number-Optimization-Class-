% Figure 1: The interior point method for solving linear programming2
% Given ~x0, lamda0, and s0, in which lamda0,s0 >= 0.
% For k = 0; 1;......
%   Choose sigma belong [0,1] and solve
%     update xkk sk
%   where uk =(lamda_k*s_k)/m, ^k = diag(~k), Sk = diag(~sk).
%  compute alphak
%  (xk+1; lamda_k+i s_k+1) =(x_k; lamda_k;s_k)+alphak*(delatX :delatLamda:delatS)
%   is in the region N(r) ={ f(x; lamda; s)|ladma*s>=r*uk}  
% for some r = 0.001.

% EXAMPLE
% max z=8*x1+5*x2
% s.t. 2*x1+x2<=1000
%      3*x1+4*x2<=2400
%      x1+x2<=700
%      x1-x2<=350

function [Z X]=interior_point_method(A, b, c, x0, lambda0, s0)
  X=[0;0]; %init returnX record path
  %init ¬ÛÃöÅÜ¼Æ
  x = x0;
  lambda=lambda0;
  s = s0;
  F = [x;lambda;s];
  [m,n] = size(A);
  sigma = 0.4;
  alpha = 500;
  u = (lambda'*s)/m;
  r=0.001;
  
  while(u >0.001 )   % ¦¬ÀÄ±ø¥óu==0 
     H=[zeros(n,n),-A',zeros(n,m);-A,zeros(m,m),eye(m);zeros(m,n),diag(s),diag(lambda)];
     u = (lambda'*s)/m;
     g = [A'*lambda-c;A*x-s-b;sigma*u*ones(m,1)-diag(lambda)*diag(s)*ones(m,1)];
     d=H\g;
     %compute appropriate alpha
     try_point= F+alpha*d; %¥ý¨«¤@ alpha ³o¼Ë¤j¤@¨B¸Õ¸Õ¬Ý  
     while(min(try_point(n+1:n+m).*try_point(n+m+1:n+2*m))<r*u) %ÀË¬d³o¤@¨B¬O§_·|¶V¬É
        alpha=alpha/2;  %¨«¤p¨B¤@ÂI
        try_point= F+alpha*d; %¦A¨«¨«¬Ý        
     end
     
     %update
     F = F+alpha*d;  %¥¿¦¡¨« updata
     x = F(1:n);
     lambda = F(n+1:n+m);
     s = F(n+m+1:n+2*m);     X=[X x];  %record path
  end
   x
   Z=c'*x;
end