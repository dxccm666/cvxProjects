m = 10;
n = 20;
A = illumdata();
cvx_begin
    variable x5(m);
    minimize max(max(A*x5,inv_pos(A*x5)));
    subject to
        0 <= x5 <= 1
cvx_end
max(abs(log(A*x5)))
