%{ 
    GNU Octave
    version = 3.8.2
    http://octave-online.net/

    GNU Octave
    version = 4.0.0
    Windows XP

%} 

function [outputX, outputCase] = InteriorPointMethod(c, A, b, x0, lambda0, s0);
    %{ 
        min c^T * x
        s.t.
            A*x >= b
    %}
    %{ 
        min c^T * x
        s.t.
            A*x  - s = b
            s >= 0
    %}
    error = 1e-5;
    maxIteration = 1000;
    %  Define: (0) solved, (1) unbounded, (2) infeasible.
    caseSolved       = int8(0);
    caseUnbounded    = int8(1);
    caseInfeasible   = int8(2);
    caseMaxIteration = int8(3);
    % Check the number of dimensions.
    if( 2 ~= ndims(c) || 2 ~= ndims(A) || 2 ~= ndims(b) || 2 ~= ndims(x0) )
        fprintf(2, 'Error: The number of dimensions in the input arguments must be TWO.\n');
        outputX = x0;
        outputCase = caseInfeasible;
        return;
    end
    % Check the sizes of the input arguments.
    [m, n] = size(A);
    if( any( [n, 1] ~= size(c) ) || any( [m, 1] ~= size(b) ) || any( [n, 1] ~= size(x0) ) )
        fprintf(2, 'Error: The sizes of the input arguments are wrong.\n');
        outputX = x0;
        outputCase = caseInfeasible;
        return;
    end
    % Check x0 is satisfied all constraints.
    %{
    if( ~ all(A*x0 >= b) )
        fprintf(2, 'Error: x0 must be satisfied A*x0 >= b.\n');
        outputX = x0;
        outputCase = caseInfeasible;
        return;
    end
    %}
    % Step (1)

    x_k = x0;
    lambda_k = lambda0;
    s_k = s0;
    
    for k = 1 : maxIteration
        % Step (3)
        sigma_k = 0.5;
        mu_k = dot(lambda_k, s_k)/m;
        
        temp_A = zeros( n + 2*m, n + 2*m);
        temp_A( 1:n, n+ 1 : n+ m) = -A';
        temp_A( n+ 1 : n+ m, 1:n) = A;
        temp_A( n+ 1 : n+ m, n+m+ 1 : n+m+ m) = eye(m);
        temp_A( n+m + 1 : n+m + m, n + 1 : n + m ) = diag(s_k);
        temp_A( n+m+ 1 : n+m + m, n+m + 1 : n+m + m) = diag(lambda_k);
        
        temp_b = zeros( n+2*m, 1);
        temp_b(1:n,1) = A'*lambda_k - c;
        temp_b(n+1:n+m,1) = A*x_k - s_k - b;
        temp_b(n+m+1:n+m+m,1) = sigma_k * mu_k * ones(m,1) - lambda_k .* s_k;
        
        temp_x = mldivide(temp_A,temp_b);
        
        delta_x_k = temp_x(1:n,1);
        delta_lambda_k = temp_x(n+1:n+m,1);
        delta_s_k = temp_x(n+m+1:n+m+m,1);
        % Step (4)
        alpha = 1;
        gamma = 1e-3;
        for l = 1 : maxIteration
            x_kp1 = x_k + alpha * delta_x_k;
            lambda_kp1 = lambda_k + alpha * delta_lambda_k;
            s_kp1 = s_k + alpha * delta_s_k;
            mu_kp1 = dot(lambda_kp1, s_kp1)/m;
            if( all( lambda_kp1 .* s_kp1 >= gamma*mu_kp1) && A'*lambda_kp1 == c && A*x_kp1 == s_kp1 + b )
                break;
            else
                alpha = alpha/2;
            end
        end
        if(norm(x_k-x_kp1) <= error)
            outputX = x_kp1;
            outputCase = caseSolved;
            return;
        end
        x_k = x_kp1;
        lambda_k = lambda_kp1;
        s_k = s_kp1;
    end
    outputX = x_kp1;
    outputCase = caseMaxIteration;
    return;
end

function text_IPM
    %{ 
        min c^T * x
        s.t.
            A*x >= b
    %}
    c = [-8; -5];
    A = [-2 -1; -3 -4; -1 -1; -1 1; 1 0; 0 1];
    b = [-1000; -2400; -700; -350; 0; 0];
    
    [m, n] = size(A);
    x0 = zeros(n, 1);
    s0 = [1000; 2400; 700; 350; 0; 0];
    lambda0 = ones(6,1);
    
    [x, myCase] = InteriorPointMethod(c, A, b, x0, lambda0, s0);
    printf('x = [%.1f; %.1f];\ncase = %d\n', x(1), x(2), myCase);
end