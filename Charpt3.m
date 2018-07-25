%数值实验三:含“实验3.1”和“实验3.2”
%子函数调用:dlsa
%输入：实验选择
%输出：原函数及求得的相应插值多项式的函数的图像以及参数alpha和误差r
result = inputdlg({'请选择实验，若选3.1，请输入1，否则输入2:'},'charpt_3',1,{'1'});
Nb = str2num(char(result));
if(Nb ~=1)&(Nb ~=2)
    errordlg('实验选择错误');
    return;
end
x0 = -1:0.5:2;
y0 = [-4.447 -0.453 0.551 0.048 -0.447 0.549 4.552];
n = 3; %拟合阶次
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
    title('离散数据的多项式拟合');
    grid on;
else
    result=inputdlg({'请输入权向量w:'},'charpt_3',1,{'[1 1 1 1 1 1 1]'});
    w = str2num(char(result));
    [a,b,c,alpha,r]=dlsa(x0,y0,w,n);
end
disp(['平方误差:',sprintf('%g',r)]);
disp(['参数alpha:',sprintf('%g\t',alpha)]);



    

    
