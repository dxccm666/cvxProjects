% Testing case for problem 2 (e)
% Written by Ryan (Weiran) Zhao 

cvx_begin
    variables x y;
    subject to
        % ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
        % Wrong formulation
        % There's the thing called no 
        % product rule
        % ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

        % x*y >= 1;
        % x >= 0;
        % y >= 0;

        % My formulation
         inv_pos(x) <= y;
         y >= 0;
cvx_end
