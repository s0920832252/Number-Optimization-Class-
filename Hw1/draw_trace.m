
function draw_trace()
step = 0.1;
X = 0:step:9;
Y = -1:step:1;
n = size(X,2);
m = size(Y,2);
Z = zeros(m,n);
for j = 1:m
for i = 1:n
 Z(j,i) = f(X(i),Y(j));
end
end
contour(X,Y,Z,50);

hold on; % this is important!! This will overlap your plots.
% plot the trace
% You can record the trace of your results and use the following
% code to plot the trace.
%xk = [9 8 8 7 7 6 6 5 5 4 4 3 3 2 2];
%yk = [.5 .5 -.5 -.5 .5 .5 -.5 -.5 .5 .5 -.5 -.5 .5 .5 -.5];





Xs=[9;1];
g=[1;9];
H=[1,0;0,9];
pathS=step_descent(Xs);
pathN=Newton(Xs);
plot(pathN(1,:),pathN(2,:));
plot(pathS(1,:),pathS(2,:));
axis  equal ;

title('my homework');xlabel('x-label');ylabel('y-label');

h_leg =legend('contour','Newton','step_descent');
set(h_leg,'position',[0.2 0.2 0.2 0.1]);

%plot(xk,yk,'-','LineWidth',3);
hold off;

% function definition
 function z = f(x,y)
 z = (x*x+9*y*y)/2;
 end

 function N = Newton(Xs)
   N = Xs;
   G=[1;1];
   while( ~isequal(round(G,5),[0;0]) )
     G=[g(1)*Xs(1);g(2)*Xs(2)];
     Xs = Xs-(H\G);
     N = [N Xs];
   end
 end
 function S = step_descent(Xs)
   S = Xs;
   G=[1;1];

   while( ~isequal(round(G,5),[0;0]) )
     G=[g(1)*Xs(1);g(2)*Xs(2)];
     Xs = Xs-(((G)'*H*(G))^(-1)*((G)'*(G)))*(G);
     S = [S Xs];
   end
 end
end