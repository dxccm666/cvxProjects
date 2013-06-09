% Testing case for problem 2 (b)
% Written by Ryan (Weiran) Zhao 

cvx_begin
    variables x y;
    subject to
        % ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
        % Wrong formulation
        % square is not a nondecreasing 
        % function, (the outer one)
        % ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

        % square(square(x+y)) <= x-y

        % My formulation
        square_pos(square(x+y)) <= x-y
cvx_end
