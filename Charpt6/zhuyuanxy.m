function B = zhuyuanxy( A,Nb )
%主元选取变换
[row col] = size(A);
B = zeros(row,col);
for i = 1:row-1
    B(i:row,i:col) = zhuyuanxy1(A,Nb);
    A = B(i+1:row,i+1:col);
end
end

