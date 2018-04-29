function y = jacobi( A,b,x0,tol )
% yacobiµü´ú·¨
[r c] = size(b);
if(r == 1)
    b = b';
end
[r c] = size(x0);
if(r == 1)
    x0 = x0';
end
clear r c
if(isempty(tol)||tol==0)
    tol = 1.0e-6;
end
D = diag(diag(A));
U = triu(A,1);
L = triu(A',1)';
B = -D\(L+U);
f = D\b;
y = B*x0+f;
n = 1;
while norm(y-x0)>=tol
    x0 = y;
    y = B* x0+f;
    n = n+1;
end
end

