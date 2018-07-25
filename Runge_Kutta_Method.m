function [ x,y ] = Runge_Kutta_Method( func,bt,up,y0,h )
%����R-K��
%����:funcΪf(x),up,bt�ֱ�Ϊxȡֵ���ޡ�����,y0Ϊ��ֵy(0),hΪ����
%���:x,y�ֱ�Ϊx,y=f(x)�ļ���ֵ
x = bt:h:up;
y = zeros(size(x));
y(1) = y0;
for i=1:length(x)-1
    k1 = func(x(i),y(i));
    k2 = func(x(i)+h/2,y(i)+h/2*k1);
    k3 = func(x(i)+h/2,y(i)+h/2*k2);
    k4 = func(x(i)+h,y(i)+h*k3);
    y(i+1) = y(i)+h*(k1+2*(k2+k3)+k4)/6;
end

