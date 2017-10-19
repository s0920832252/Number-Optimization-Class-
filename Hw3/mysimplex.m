function [x, Case] = mysimplex(c, A, b, x0)

type='max';
[m,n]=size(A);
A=A(:,1:2);

%我用不到x0 ㄟ...怎麼辦= =
% eg: Xb=B\b 就可得到起始位址啦...XD]
%    要怎麼去判定 x0 是否在feasible region ???
[A, X, Z] = My_simplex(type, A, b,c);

hold on;
Mycontour()
scatter(X(1,:),X(2,:),'*');
plot(X(1,:),X(2,:),'--');
end

