% EXAMPLE
% max z=8*x1+5*x2
% s.t. 2*x1+x2<=1000
%      3*x1+4*x2<=2400
%      x1+x2<=700
%      x1-x2<=350

function main

A=[-2,-1;-3,-4;-1,-2;-1,1;1,0;0,1];
b=[-1000;-2400;-700;-350;0;0];
c=[-8;-5];
lambda0=[1;1;1;1;1;1];
x0=[0;0];
s0=[1000;2400;700;350;0;0];


[Z X]=interior_point_method(A, b, c, x0, lambda0, s0);
hold on;

scatter(X(1,:),X(2,:));
plot(X(1,:),X(2,:),'-');


end

