function [a,b,c,alpha,r] = dlsa( x,y,w,n )
%����:����������������ɢ����������ʽ��С������ϡ�
%����:m+1����ɢ��(x,y,w),x,y,w�ֱ�������������
%     ��϶���ʽ�Ĵ��� n,0<n<m.
%���:������ƹ�ʽ�Ĳ���a,b,��϶���ʽs(x)��ϵ��c��alpha,
%     ƽ�����r = (y-s,y-s),������ɢ���к�������ߵ�ͼ��
m = length(x)-1;
if(n<1||n>=m)
    errordlg('����:n<1����n>=m!');
    return;
end
%��������ƹ�ʽ�Ĳ���a,b,��϶���ʽs(x)��ϵ��c,����d(k)=(y,sk)
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
%��ƽ�����r
r = y.*y* w'-c*d';
%����϶���ʽ�Ľ��ݲ���alpha
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
%���ؾ��ط�������s(t)��������У�t,s)
xmin = min(x);xmax = max(x);dx = (xmax - xmin)/(25 * m);
t = (xmin-dx):dx:(xmax+dx);
s = alpha(1);
for k = 2:n+1
    s = s.*t + alpha(k);
end
%���������x-y���������t-sͼ��
plot(x,y,'*',t,s,'-');
title('��ɢ���ݵĶ���ʽ���');
xlabel('x');ylabel('y');
grid on;
end

