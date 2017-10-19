function Hw2_3()
clear;
clc;

% f(x; y)  z= (1-x)^2+100*(y-x^2)^2
%  (a) Derive the gradient and the Hessian of f(x; y).
%  (b) Implement the backtracking line-search method, and make it a function.
%      Your input should at least include
%     The current solution ~xk.
%     The search direction ~pk.
%     The function that can evaluate f(~z) for a given ~z.
%     The function that can evaluate rf(~z) for a given ~z.
%  (c) Implement (1) the steepest descent method (2) Newton's method (3) CG
%      and (4) BFGS. Use your line search algorithm to %find the best step length.
%      Use (x0; y0) = (-1:2; 1:0) as the initial guess and compare their results.
%      Draw the convergence %gures of those four methods, whose y-axis is log(gradient_j)
%      and x-axis is the number of iterations. You can use Matlab's semilogy for
%      the plot.
%      (Do not use any symbolic computation of Matlab, like sub or diff%, or eval.
%      Write your own function, gradient, and Hessian subroutines, and use them
%      in your code.



 X=[-1.2;1];
 
S=step_descent(X)
S_count=1:size(S,2);
delat_y_norm=norm_y(S(3:4,:),size(S,2));
figure('name','step_descent','Position',[50, 30, 850, 400]);
subplot(1,2,1);
semilogy(S_count,delat_y_norm);
title('convergence');xlabel('X_count');ylabel('|delta_f(x)|');

%set(gca,'ydir','reverse','xaxislocation','top'); % ?§¤?­ì??¦b¥ª¤W¨¤
 subplot(1,2,2);
 test_contour(-0.2,1.3);
 hold on;
 plot(S(1,:),S(2,:),'red');
 scatter(S(1,:),S(2,:));
 title('path');xlabel('X_aix');ylabel('y_aix');




N=Newton(X)
N_count=1:size(N,2);
delat_y_norm=norm_y(N(3:4,:),size(N,2));
figure('name','Newton','Position',[100, 40, 850, 400]);
subplot(1,2,1);
hold on;
semilogy(N_count,delat_y_norm);
title('convergence');xlabel('X_count');ylabel('|delta_f(x)|');
subplot(1,2,2);
test_contour(-3.7,2);
hold on;
plot(N(1,:),N(2,:),'red');
scatter(N(1,:),N(2,:));
title('path');xlabel('X_aix');ylabel('y_aix');

C=conjgate(X)
C_count=1:size(C,2);
delat_y_norm=norm_y(C(3:4,:),size(C,2));
figure('name','conjgate','Position',[150, 50, 850, 400]);
subplot(1,2,1);
hold on;
semilogy(C_count,delat_y_norm);
title('convergence');xlabel('X_count');ylabel('|delta_f(x)|');
subplot(1,2,2);
test_contour(-0.2,1.5);
hold on;
plot(C(1,:),C(2,:),'red');
scatter(C(1,:),C(2,:));
title('path');xlabel('X_aix');ylabel('y_aix');

B=BFGS(X)
B_count=1:size(B,2);
delat_y_norm=norm_y(B(3:4,:),size(B,2));
figure('name','BFGS','Position',[200, 60, 850, 400]);
subplot(1,2,1);
hold on;
semilogy(B_count,delat_y_norm);
title('convergence');xlabel('X_count');ylabel('|delta_f(x)|');
subplot(1,2,2);
test_contour(-0.2,1.5);
hold on;
plot(B(1,:),B(2,:),'red');
scatter(B(1,:),B(2,:));
title('path');xlabel('X_aix');ylabel('y_aix');


    

    
    function delat_y_norm=norm_y(S,length)
        for i=1:length
           delat_y_norm(i)=norm(S(:,i),1);
        end
    
    end

 
end