% for problem 2 (d) THIS IS A TRICKY ONE
% Written by Ryan (Weiran) Zhao 

cvx_begin
    variables x y u v;
    subject to 
        % ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
        % Wrong formulation
        % Important to know norm is not
        % monotonic function
        % ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
        % norm([max(x,1), max(y,2)]) <= 3*x+y

        % My formulation (from answer book)
        norm([u,v]) <= 3*x+y
        max(x,1) <= u
        max(y,2) <= v

cvx_end
