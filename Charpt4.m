%数值实验四:含"实验4.1:复化求积公式计算定积分"和
%"实验4.2:比较复化Simpson方法与变步长Simpson方法"
result = inputdlg({'请选择实验，若选4.1，请输入1，否则输入2：'},'charpt 4',1,{'1'});
Nt = str2num(char(result));
if (Nt~=1)&&(Nt~=2)
    errording('实验选择错误');
    return;
end
if(Nt == 1)
    promps = {'请选择积分公式，若用复化梯形，输入T,用复化Simpson,输入S，用复化Gauss_Legendre,输入G:'};
    result = inputdlg(promps,'charpt 4,',1,{'T'});
    Nb = char(result);
    if(Nb ~= 'T' && Nb ~= 'S' && Nb ~= 'G')
        errordlg('积分公式选择错误！');
        return;
    end
    result = inputdlg({'请输入积分式题号1-4：'},'实验4.1',1,{'1'});
    Nb_f = str2num(char(result));
    if(Nb_f<1||Nb_f>4)
        errordlg('没有该积分式！');
        return;
    end
    switch Nb_f
        case 1
            fun = inline('-2./(x.^2-1)');a=2;b=3;
        case 2
            fun = inline('4./(x.^2+1)');a=0;b=1;
        case 3
            fun = inline('3.^x');a=0;b=1;
        case 4
            fun = inline('x.*exp(x)');a=1;b=2;
    end
    tol = 0.5e-7;
    if(Nb=='T')%使用复化梯形公式
        tic;
        t = (fun(a) + fun(b))*(b-a)/2;
        k=1;t0=0;
        while(abs(t-t0) >= tol*3)
            t0 = t;h = (b-a)/2^k;
            t = t0/2 + h*sum(fun(a+h:2*h:b-h));
            k=k+1;
        end
        time = toc;
    elseif(Nb == 'S')%用复化Simpson公式
        %先根据复化Simpson公式的余项估计步长
        promps={'请输入用复化Simpson公式应取的步长:'};
        result = inputdlg(promps,'实验4.2',1,{'0.01'});
        h = str2num(char(result));
        if(h <= 0)
            r=errordlg('请输入正确步长!');
            return;
        end
        tic;
        N = floor((b-a)/h);
        detsum = 0;
        for i = 1:N-1
            xk = a+i*h;
            detsum = detsum + fun(xk);
        end
        t = h*(fun(a)+fun(b)+2*detsum)/2;
        time = toc;
    elseif(Nb == 'G')%用复化Gauss_Legendre I
        %先根据复化Gauss_Legendre I公式的余项估计步长
        promps = {'请输入用复化Gauss_Legendre I公式应取的步长:'};
        result = inputdlg(promps,'实验4.2',1,{'0.01'});
        h = str2num(char(result));
        if(h <= 0)
            errordlg('请输入正确的步长!');
            return;
        end
        tic;
        N = floor((b-a)/h);t = 0;
        for k = 0:N-1;
            xk = a+k*h+h/2;
            t=t+fun(xk-h/(2*sqrt(3)))+fun(xk+h/(2*sqrt(3)));
        end;
        t = t*h/2;
        time = toc;
    end
    disp(['实验4.1题(',num2str(Nb_f),')的计算结果：',num2str(t)]);
    switch Nb_f
        case 1
            disp('精确解：ln2-ln3=-0.405465108')
            disp(['绝对误差：',num2str(abs(t+0.405465108))]);
            disp(['运行时间：',num2str(time)]);
        case 2
            disp('精确解：pi=3.14159265358979')
            disp(['绝对误差：',num2str(abs(t-pi))]);
            disp(['运行时间：',num2str(time)]);
        case 3
            disp('精确解：2/ln3=1.82047845325368')
            disp(['绝对误差：',num2str(abs(t-1.82047845325368))]);
            disp(['运行时间：',num2str(time)]);
        case 4
            disp('精确解：e^2=7.38905609893065')
            disp(['绝对误差：',num2str(abs(t-7.38905609893065))]);
            disp(['运行时间：',num2str(time)]);
    end
elseif(Nt == 2)
    promps = {'请选择积分公式，若用复化Simpson,输入S,用变步长Simpson,输入V:'};
    result = inputdlg(promps,'charpt 4',1,{'T'});
    Nb=char(result);
    if(Nb ~= 'S' && Nb ~= 'V')
        errordlg('积分公式选择错误！');
        return;
    end
    result = inputdlg({'请输入积分式题号1-3:'},'实验4.2',1,{'1'});
    Nb_f = str2num(char(result));
    if(Nb_f < 1 || Nb_f > 3)
        errordlg('没有该积分式！');
        return;
    end
    switch Nb_f
        case 1
            fun = inline('x.^6/10-x.^2+x');a=0;b=2;
        case 2
            fun = inline('x.^2.*sqrt(x)');a=0;b=1;
        case 3
            fun = inline('1./sqrt(x)');a=5;b=200;
    end
    tol = 0.5e-7;
    if(Nb == 'S')%用复化Simpson公式
        promps = {'请输入用复化Simpson公式应取的步长:'};
        result = inputdlg(promps,'实验4.',1,{'0.01'});
        h = str2num(char(result));
        if(h<=0)
            errordlg('请输入正确的步长');
            return;
        end
        tic;
        N = floor((b-a)/h);
        detsum=0;
        for i=1:N-1
            xk = a+i*h;
            detsum = detsum + fun(xk);
        end
        t = h*(fun(a)+fun(b)+2*detsum)/2;
        n = 2*N+1;%所需节点数
        time = toc;
    elseif(Nb == 'V')%用变步长Simpson
        tic;
        [t,iter] = quad(fun,a,b,tol);
        n = 2*iter+1;
        time = toc;
    end
    if(Nb == 'S')
        disp('用复化Simpson公式计算:');
        disp(['所需节点数:',num2str(n)]);
        disp(['求得的近似值:',num2str(t)]);
        disp(['运行时间:',num2str(time)]);
    elseif(Nb == 'V')
        disp('用变步长Simpson公式计算:');
        disp(['所需节点数:',num2str(n)]);
        disp(['求得的近似值:',num2str(t)]);
        disp(['运行时间:',num2str(time)]);
    end
end
        
        
        
        
        
            
                
            
            
        
        
            
            
        
            
