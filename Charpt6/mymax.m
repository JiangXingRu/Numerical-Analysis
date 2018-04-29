function [m,l] = mymax(x)
%获取数列x中绝对值最大的值及下标
m = x(1);
l = 1;
n = length(x);
for i = 2:n
    if(abs(x(i)>abs(m))
        m = x(i);
        l = i;
    end
end

