% Problem 3 of project 1 (aka extra problem 3)
% Written by Ryan (Weiran) Zhao 
% Sat,Jun 08th 2013 09:51:59 PM EDT

ccc
% load illumdata by call 'illumdata'
A   =   illumdata();

% number of lights
m   =   10;
% number of patches
n   =   20;

p   =   ones(m,1); 

% ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
% Method 1
% Equal lamp powers
% ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
no_pts = 1000;
gamma =     linspace(0,1,no_pts);
fp  =   ones(1,no_pts);
for i=1: no_pts
    p(:) = gamma(i);
    fp(i) = max(abs(log(A*p)));
end
[fp1,idx1] = min(fp);
disp('============================================================');
disp(sprintf('minimum fp = %.4e, with gamma = %.4e',fp1,gamma(idx1)));

figure 
hold on
plot(gamma,fp);
title('Equal lamp powers');
hold off

% ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
% Method 2
% Least-squares with saturation
% ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

b = ones(n,1);
p2 = A\b;
p2 = max(p2,0);
p2 = min(p2,1);
disp('============================================================');
disp(sprintf('minimum fp =%.4e, with p =',max(abs(log(A*p2)))));
disp(p2);

% ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
% Method 3
% Regularized least-squares
% ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

no_pts3 = 10;
p3 = ones(m,no_pts3);
fp3 = ones(1,no_pts3);
% the number in linspace needs tunning
rho = linspace(7.5,8,no_pts3);
for i = 1: no_pts3
    A3 = A'*A+rho(i)*eye(m);
    b3 = 1/2*rho(i)*ones(m,1)+A'*ones(n,1);
    p3(:,i) = A3\b3;
    fp3(i)=max(abs(log(A*p3(:,i))));
end

[fp3_min,idx3]=min(fp3);
disp('============================================================');
disp(sprintf('minimum fp = %.4e, with p =',fp3_min));
disp(p3(:,idx3));

% ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
% Method 4
% Chebyshev approximation
% ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

cvx_begin quiet
    variable x(m) ;
    minimize norm(A*x-ones(n,1),inf);
    subject to
        0 <= x <= 1;
cvx_end
disp('============================================================');
disp(sprintf('minimum fp = %.4e, with p =', max(abs(log(A*x)))));
disp(x);

% ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
% Method 5
% Exact solution
% ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
cvx_begin quiet
    variable x5(m);
    minimize max(max(A*x5,inv_pos(A*x5)));
    subject to
        0 <= x5 <= 1
cvx_end
disp('============================================================');
disp(sprintf('minimum fp = %.4e, with p =', max(abs(log(A*x5)))));
disp(x5);
