function [m,l] = mymax(x)
%��ȡ����x�о���ֵ����ֵ���±�
m = x(1);
l = 1;
n = length(x);
for i = 2:n
    if(abs(x(i)>abs(m))
        m = x(i);
        l = i;
    end
end

