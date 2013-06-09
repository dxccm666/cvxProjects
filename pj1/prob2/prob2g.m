% Testing case for problem 2 (g)
% Written by Ryan (Weiran) Zhao 

cvx_begin
    variables x y;
    subject to
        % ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
        % Wrong formulation
        % x^3 is only convex for x > 0
        % ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
        % x^3 + y^3 <= 1;
        % x >= 0;
        % y >= 0;
        
        % My formulation
        pow_pos(x,3) + pow_pos(y,3) <= 1;
cvx_end
