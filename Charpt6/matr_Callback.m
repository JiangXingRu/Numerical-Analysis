function  matr_Callback
% ��ȡ��������
N = get(gco,'value');
global B h_msize h_vect
if(N == 1)
    row = str2num(get(h_msize,'string'));
    b = [7 ones(1,row - 2) * 15 14];
    set(h_vect,'string',num2str(b));
elseif(N == 3)
   Ans = inputdlg('��������� A:','Charpt6',2);
   B = str2num(Ans{1});
end

