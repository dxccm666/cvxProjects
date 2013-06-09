% Testing case for problem 2 (h)
% Written by Ryan (Weiran) Zhao 
% This one is TRICKY 

cvx_begin
    variables x y z;
    subject to
        % ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
        % Wrong formulation
        % x*y - z^2 is not concave
        % ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
        % x+z <= 1+sqrt(x*y-z^2);
        % x >= 0;
        % y >= 0;

        % ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
        % My formulation
        % I check answer and 
        % geometric mean is a concave 
        % function and non-decreasing
        % ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
        x+z <= 1+ geo_mean([x-quad_over_lin(z,y), y]);
        x >= 0;
        y >= 0;
cvx_end
