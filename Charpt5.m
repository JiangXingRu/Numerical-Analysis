%��ֵʵ��5.2��5.3:�Ƚ�4��AdamsԤ��-У�����뾭��R-K���ļ��㾫�ȼ��ķ�ʱ��
%�Ӻ�������:Runge_Kutta_Method
%����:����h�����̽ⷨѡ��
%���:��ȷ�����ֵ��ͼ�ζԱ�
result = inputdlg({'������(0,1]֮��Ĳ���:'},'charpt5_2',1,{'0.2'});
h = str2num(char(result));
if(h > 1 || h <= 0)
    errordlg('������(0,1]��Ĳ�����');
    return;
end
result = inputdlg({'��ѡR-K����������1����������2:'},'charpt5_2',1,{'1'});
Nb = str2num(char(result));
if((Nb ~= 1) && (Nb ~= 2))
    errordlg('ѡ�����!');
    return;
end
func = inline('-y+cos(2*x)-2*sin(2*x)+2*x.*exp(-x)');
tic;
[x,y1] = Runge_Kutta_Method(func,0,2,1,h);  % ����R-K��
time = toc;
N = length(x);
if(Nb == 2)
    %4��AdamsԤ��У��������
    tic;
    y = x;
    f = x;
    y(1) = y1(1);y(2) = y1(2);
    y(3) = y1(3);y(4) = y1(4);
    ynp = 0;
    ync = 0;
    f(1) = func(x(1),y(1));
    f(2) = func(x(2),y(2));
    f(2) = func(x(3),y(3));
    for n = 4:N-1
        f(n) = func(x(n),y(n));
        ynlp = y(n)+h/24*(55*f(n)-59*f(n-1)+37*f(n-2)-9*f(n-3));
        ynlpm = ynlp+251/270*(ync-ynp);
        ynlc = y(n)+h/24*(9*func(x(n+1),ynlpm)+19*f(n)-5*f(n-1)+f(n-2));
        y(n+1) = ynlc-19/270*(ynlc-ynlp);
        ync = ynlc;
        ynp = ynlp;
    end
    time = toc;
else
    y = y1;
end
y0 = x.^2.*exp(-x)+cos(2*x);
plot(x,y0,'g+');
hold on;
plot(x,y,'b--');
xlabel('x');
ylabel('y0 = x.^2.*exp(-x)+cos(2*x):+and Adams(x)--');
d = floor(length(x)/10);
disp(['ʮ���Ⱦ�ڵ�:',num2str(x(1:d:N))]);
disp(['��Ӧ�ļ���ֵ:',num2str(y(1:d:N))]);
disp(['��Ӧ�ľ�ȷֵ:',num2str(y0(1:d:N))]);
disp(['CPUʱ��:',num2str(time)]);