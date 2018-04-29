function clear_Callback
%复位按钮响应函数
global h_result h_main_e h_err h_sw
set(h_result,'string','');
set(h_main_e,'enable','on');
set(h_err,'enable','off');
set(h_sw,'enable','off');
end

