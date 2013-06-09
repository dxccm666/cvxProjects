% Testing case for problem 2 (f)
% Written by Ryan (Weiran) Zhao 

cvx_begin
    variables x y;
    subject to
        % ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
        % Wrong formulation
        % Should use quardratic_over_linear
        % function
        % ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
        % (x+y)^2/sqrt(y) <= x-y +5 

        % ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
        % My formulation
        % Q_over_L is convex in both x 
        % and y >0 and non_increasing in y
        % ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
        quad_over_lin(x+y,sqrt(y)) <= x-y+5
cvx_end
