% Testing case for problem 2 (a)
% Written by Ryan (Weiran) Zhao 

% A is obtained by expand out norm (...) function
% and then put it in matrix form
A=[2,1;1,5];
[U, S, V] = svd(A);
P = U*sqrt(S);

cvx_begin
    variable x(2);
    subject to 
        % ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
        % given formulation
        % Wrong for put a convex, not 
        % affine function for equality
        % ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
         
        % norm([x(1)+2*x(2), x(1)-x(2)]) ==0

        % my formulation
         x'*P == 0;
cvx_end
