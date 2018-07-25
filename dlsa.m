function [a,b,c,alpha,r] = dlsa( x,y,w,n )
%功能:用正交化方法对离散数据作多项式最小二乘拟合。
%输入:m+1个离散点(x,y,w),x,y,w分别用行向量给出
%     拟合多项式的次数 n,0<n<m.
%输出:三项递推公式的参数a,b,拟合多项式s(x)的系数c和alpha,
%     平方误差r = (y-s,y-s),并作离散点列和拟合曲线的图形
m = length(x)-1;
if(n<1||n>=m)
    errordlg('错误:n<1或者n>=m!');
    return;
end
%求三项递推公式的参数a,b,拟合多项式s(x)的系数c,其中d(k)=(y,sk)
s1 = 0; s2 = ones(1,m+1); v2=sum(w);
d(1) = y*w';c(1)=d(1)/v2;
for k = 1:n
    xs = x.*s2.^2*w';a(k) = xs/v2;
    if(k == 1)
        b(k) = 0;
    else
        b(k) = v2/v1;
    end
    s3 = (x-a(k)).*s2-b(k)*s1;
    v3 = s3.^2 * w';
    d(k+1) = y.*s3*w';c(k+1) = d(k+1)/v3;
    s1 = s2;s2 = s3;v1 = v2;v2 = v3;
end
%求平方误差r
r = y.*y* w'-c*d';
%求拟合多项式的降幂参数alpha
alpha = zeros(1,n+1);T=zeros(n+1,n+2);
T(:,2)=ones(n+1,1);T(2,3)=-a(1);
if(n>=2)
    for k=3:n+1
        for i=3:k+1
            T(k,i) = T(k-1,i)-a(k-1)*T(k-1,i-1)-b(k-1)*T(k-2,i-2);
        end
    end
end
for i = 1:n+1
    for k = i:n+1
        alpha(n+2-i) = alpha(n+2-i)+c(k)*T(k,k+2-i);
    end
end
%用秦九韶方法计算s(t)的输出序列（t,s)
xmin = min(x);xmax = max(x);dx = (xmax - xmin)/(25 * m);
t = (xmin-dx):dx:(xmax+dx);
s = alpha(1);
for k = 2:n+1
    s = s.*t + alpha(k);
end
%输出点序列x-y和拟合曲线t-s图形
plot(x,y,'*',t,s,'-');
title('离散数据的多项式拟合');
xlabel('x');ylabel('y');
grid on;
end

