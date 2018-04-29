function func_on_ok
%"ok"按钮响应函数，总执行函数
%子函数调用:mymax/zhuyuanxy1/zhuyuanxy/jacobi/g_seidel/sor
global h_matr h_msize h_vect h_appr h_main_e h_err h_sw h_x0 h_result
row = str2num(get(h_msize,'string'));
switch get(h_matr,'value')
    case 1
        a1 = sparse(1:row,1:row,6);
        a2 = sparse(1:row-1,2:row,1,row,row);
        A = a1 + a2 + 8 * a2';
    case 2
        A = hilb(row);
    case 3
        global B;
        A = B;
end
b = str2num(get(h_vect,'string'));
N = get(h_appr,'value');
X = zeros(row,1);
if(N == 1)
    Nb = get(h_main_e,'value');
    B = zhuyuanxy([A b'],Nb);
    [row col] = size(B);
    X(row) = B(row,col)/B(row,row);
    for k=(row-1):-1:1
        X(k) = (B(k,col)-B(k,k+1:row)*(X(k+1:row)))/B(k,k);
    end
else
    tol = str2num(get(h_err,'string'));
    x0 = str2num(get(h_x0,'string'));
    if isempty(x0)
        errordlg('请输入初值x0');
        return;
    end
    if(N == 2)
        X = jacobi(A,B,x0,tol);
    elseif(N == 3)
        X = g_seidel(A,b,x0,tol);
    elseif(N == 4)
        w = str2num(get(h_sw,'string'));
        X = sor(A,b,w,x0,tol);
    end
end
[r c] = size(X);
if(r~=1)
    X = X';
end
set(h_result,'string',num2str(X));
end

