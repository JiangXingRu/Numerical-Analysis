function on_approach
%算法选择响应函数
global h_main_e h_err h_sw h_x0
N = get(gco,'value');
if(N == 1)
    set(h_main_e,'enable','on');
    set(h_err,'enable','off','backgroundcolor',[0.83 0.81 0.78]);
    set(h_sw,'enable','off','backgroundcolor',[0.83 0.81 0.78]);
    set(h_x0,'enable','off','backgroundcolor',[0.83 0.81 0.78]);
else
    set(h_err,'enable','on','backgroundcolor',[1 1 1]);
    set(h_sw,'enable','on','backgroundcolor',[1 1 1]);
    set(h_x0,'enable','on','backgroundcolor',[1 1 1]);
    set(h_main_e,'enable','off');
end

