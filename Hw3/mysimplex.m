function [x, Case] = mysimplex(c, A, b, x0)

type='max';
[m,n]=size(A);
A=A(:,1:2);

%�ڥΤ���x0 ��...����= =
% eg: Xb=B\b �N�i�o��_�l��}��...XD]
%    �n���h�P�w x0 �O�_�bfeasible region ???
[A, X, Z] = My_simplex(type, A, b,c);

hold on;
Mycontour()
scatter(X(1,:),X(2,:),'*');
plot(X(1,:),X(2,:),'--');
end

