% Testing case for problem 2 (c)
% Written by Ryan (Weiran) Zhao 

cvx_begin
    variables x y;
    subject to
        % ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
        % Wrong formulation
        % 1/x is separate at 0, should
        % use inv_pos instead
        % ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

        % 1/x+1/y <=1;
        % x >= 0;
        % y >= 0;

        % My formulation
         inv_pos(x)+inv_pos(y) <= 1;
cvx_end
