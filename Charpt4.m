%��ֵʵ����:��"ʵ��4.1:���������ʽ���㶨����"��
%"ʵ��4.2:�Ƚϸ���Simpson������䲽��Simpson����"
result = inputdlg({'��ѡ��ʵ�飬��ѡ4.1��������1����������2��'},'charpt 4',1,{'1'});
Nt = str2num(char(result));
if (Nt~=1)&&(Nt~=2)
    errording('ʵ��ѡ�����');
    return;
end
if(Nt == 1)
    promps = {'��ѡ����ֹ�ʽ�����ø������Σ�����T,�ø���Simpson,����S���ø���Gauss_Legendre,����G:'};
    result = inputdlg(promps,'charpt 4,',1,{'T'});
    Nb = char(result);
    if(Nb ~= 'T' && Nb ~= 'S' && Nb ~= 'G')
        errordlg('���ֹ�ʽѡ�����');
        return;
    end
    result = inputdlg({'���������ʽ���1-4��'},'ʵ��4.1',1,{'1'});
    Nb_f = str2num(char(result));
    if(Nb_f<1||Nb_f>4)
        errordlg('û�иû���ʽ��');
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
    if(Nb=='T')%ʹ�ø������ι�ʽ
        tic;
        t = (fun(a) + fun(b))*(b-a)/2;
        k=1;t0=0;
        while(abs(t-t0) >= tol*3)
            t0 = t;h = (b-a)/2^k;
            t = t0/2 + h*sum(fun(a+h:2*h:b-h));
            k=k+1;
        end
        time = toc;
    elseif(Nb == 'S')%�ø���Simpson��ʽ
        %�ȸ��ݸ���Simpson��ʽ��������Ʋ���
        promps={'�������ø���Simpson��ʽӦȡ�Ĳ���:'};
        result = inputdlg(promps,'ʵ��4.2',1,{'0.01'});
        h = str2num(char(result));
        if(h <= 0)
            r=errordlg('��������ȷ����!');
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
    elseif(Nb == 'G')%�ø���Gauss_Legendre I
        %�ȸ��ݸ���Gauss_Legendre I��ʽ��������Ʋ���
        promps = {'�������ø���Gauss_Legendre I��ʽӦȡ�Ĳ���:'};
        result = inputdlg(promps,'ʵ��4.2',1,{'0.01'});
        h = str2num(char(result));
        if(h <= 0)
            errordlg('��������ȷ�Ĳ���!');
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
    disp(['ʵ��4.1��(',num2str(Nb_f),')�ļ�������',num2str(t)]);
    switch Nb_f
        case 1
            disp('��ȷ�⣺ln2-ln3=-0.405465108')
            disp(['������',num2str(abs(t+0.405465108))]);
            disp(['����ʱ�䣺',num2str(time)]);
        case 2
            disp('��ȷ�⣺pi=3.14159265358979')
            disp(['������',num2str(abs(t-pi))]);
            disp(['����ʱ�䣺',num2str(time)]);
        case 3
            disp('��ȷ�⣺2/ln3=1.82047845325368')
            disp(['������',num2str(abs(t-1.82047845325368))]);
            disp(['����ʱ�䣺',num2str(time)]);
        case 4
            disp('��ȷ�⣺e^2=7.38905609893065')
            disp(['������',num2str(abs(t-7.38905609893065))]);
            disp(['����ʱ�䣺',num2str(time)]);
    end
elseif(Nt == 2)
    promps = {'��ѡ����ֹ�ʽ�����ø���Simpson,����S,�ñ䲽��Simpson,����V:'};
    result = inputdlg(promps,'charpt 4',1,{'T'});
    Nb=char(result);
    if(Nb ~= 'S' && Nb ~= 'V')
        errordlg('���ֹ�ʽѡ�����');
        return;
    end
    result = inputdlg({'���������ʽ���1-3:'},'ʵ��4.2',1,{'1'});
    Nb_f = str2num(char(result));
    if(Nb_f < 1 || Nb_f > 3)
        errordlg('û�иû���ʽ��');
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
    if(Nb == 'S')%�ø���Simpson��ʽ
        promps = {'�������ø���Simpson��ʽӦȡ�Ĳ���:'};
        result = inputdlg(promps,'ʵ��4.',1,{'0.01'});
        h = str2num(char(result));
        if(h<=0)
            errordlg('��������ȷ�Ĳ���');
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
        n = 2*N+1;%����ڵ���
        time = toc;
    elseif(Nb == 'V')%�ñ䲽��Simpson
        tic;
        [t,iter] = quad(fun,a,b,tol);
        n = 2*iter+1;
        time = toc;
    end
    if(Nb == 'S')
        disp('�ø���Simpson��ʽ����:');
        disp(['����ڵ���:',num2str(n)]);
        disp(['��õĽ���ֵ:',num2str(t)]);
        disp(['����ʱ��:',num2str(time)]);
    elseif(Nb == 'V')
        disp('�ñ䲽��Simpson��ʽ����:');
        disp(['����ڵ���:',num2str(n)]);
        disp(['��õĽ���ֵ:',num2str(t)]);
        disp(['����ʱ��:',num2str(time)]);
    end
end
        
        
        
        
        
            
                
            
            
        
        
            
            
        
            
