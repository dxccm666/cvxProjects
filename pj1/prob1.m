% *********************************************
% Declaring problem data
% Check convex optimization of Boyd's book
% Question 4.17 for meaning of variables
% *********************************************

A = [ 1, 2, 0, 1;
      0, 0, 3, 1;
      0, 3, 1, 1;
      2, 1, 2, 5;
      1, 0, 3, 2];

c_max = [100; 100; 100; 100; 100];

p = [ 3; 2; 7; 6];

p_disc = [ 2; 1; 4; 2];

q = [ 4; 10; 5; 10];

% total activity level
act_num = 4;
% total resources
res_num = 5;

cvx_begin
    variables t(act_num) x(act_num);
    maximize( t'*ones(act_num,1));
    subject to
        t <= p .* x;
        t <= p .* q + p_disc .* (x-q);
        x >= 0;
        A*x <= c_max;
cvx_end
