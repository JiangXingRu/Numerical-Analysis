%��ֵʵ����:����ʵ��3.1���͡�ʵ��3.2��
%�Ӻ�������:dlsa
%���룺ʵ��ѡ��
%�����ԭ��������õ���Ӧ��ֵ����ʽ�ĺ�����ͼ���Լ�����alpha�����r
result = inputdlg({'��ѡ��ʵ�飬��ѡ3.1��������1����������2:'},'charpt_3',1,{'1'});
Nb = str2num(char(result));
if(Nb ~=1)&(Nb ~=2)
    errordlg('ʵ��ѡ�����');
    return;
end
x0 = -1:0.5:2;
y0 = [-4.447 -0.453 0.551 0.048 -0.447 0.549 4.552];
n = 3; %��Ͻ״�
if(Nb == 1)
    alpha = polyfit(x0,y0,n);
    y = polyval(alpha,x0);
    r = (y0-y) * (y0-y)';
    x = -1:0.01:2;
    y = polyval(alpha,x);
    plot(x,y,'k--');
    xlabel('x');ylabel('y0 * and polyfit.y--');
    hold on;
    plot(x0,y0,'*');
    title('��ɢ���ݵĶ���ʽ���');
    grid on;
else
    result=inputdlg({'������Ȩ����w:'},'charpt_3',1,{'[1 1 1 1 1 1 1]'});
    w = str2num(char(result));
    [a,b,c,alpha,r]=dlsa(x0,y0,w,n);
end
disp(['ƽ�����:',sprintf('%g',r)]);
disp(['����alpha:',sprintf('%g\t',alpha)]);



    

    
