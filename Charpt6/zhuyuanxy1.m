function B = zhuyuanxy1( A,Nb )
%主元选取
[row col]=size(A);
if(Nb == 2)
    [m,L] = mymax(A(1:row));
elseif(Nb == 1)
    m = A(1);
    L = 1;
elseif(Nb == 3)
    A(1:row);
    Ans = inputdlg('请输入最大主元所在的列:','Charpt6',1);
    L = str2num(char(Ans));
    m = A(L);
end
if(m == 0)
    return;
end
B = A;
B(1,:) = A(L,:);
B(L,:) = A(1,:);
for x = 2:row
    B(x,:) = B(x,:)-B(1,:)*B(x,1)/m;
end
end

