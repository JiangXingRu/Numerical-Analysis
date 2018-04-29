%数值分析实验:含"主元选取与算法稳定性"和"线性代数方程组的性态估计与条件数估计"
%输入与输出:图形界面交互式输入输出
%子函数调用:func_on_ok/on_approach/matr_Callback/clear_Callback
%分别为:"ok"按钮响应函数、算法选择响应函数、获取矩阵输入、"clear按钮响应函数"
global h0 h_matr h_msize h_vect h_appr h_main_e h_err h_sw h_x0 h_close h_clear h_result
h0 = figure(1);
set(h0,'resize','off');
uicontrol(h0,'style','text','string','矩阵:','position',[30 360 60 30],'Fontsize',10);
h_matr = uicontrol(h0,'style','popupmenu','string',{'矩阵 A','矩阵 H','其他'},...
'position',[90 360 90 30],'Fontsize',10);
set(h_matr,'BackgroundColor',[1 1 1],'callback','matr_Callback');
uicontrol(h0,'style','text','string','矩阵大小:','position',[250 360 100 30],'FontSize',10);
h_msize = uicontrol(h0,'style','edit','string','10','position',[350 360 100 30],'FontSize',10);
uicontrol(h0,'style','text','string','向量b:','position',[30 310 60 30],'FontSize',10);
h_vect = uicontrol(h0,'style','edit','string',['7 15 15 15 15 15 15 15 15 14'],'position',[90 310 360 30]);
set(h_vect,'FontSize',10,'BackgroundColor',[1 1 1]);
uicontrol(h0,'style','text','string','解 法:','position',[30 260 60 30],'FontSize',10);
h_appr = uicontrol(h0,'style','popupmenu','string',{'Gauss消元法';'J迭代法';'GS迭代法';'SOR迭代法'},...
'position',[90 260 110 30],'FontSize',10,'BackgroundColor',[1 1 1],'callback','on_approach');
uicontrol(h0,'style','text','string','主元选择:','position',[250 260 100 30],'FontSize',10);
h_main_e = uicontrol(h0,'style','popupmenu','string',{'不选主元','自动选主元','手动选主元'},...
'position',[350 260 100 30],'FontSize',10,'BackgroundColor',[1 1 1]);
uicontrol(h0,'style','text','string','误差限:','position',[30 210 60 30],'FontSize',10);
h_err = uicontrol(h0,'style','edit','string','1.0e-6',...
'position',[90 210 90 30],'FontSize',10,'BackgroundColor',[0.83 0.81 0.78],'enable','off');
uicontrol(h0,'style','text','string','松弛因子 w:','position',[250 210 100 30],'FontSize',10);
h_sw = uicontrol(h0,'style','edit','string','1.25',...
'position',[350 210 100 30],'FontSize',10,'BackgroundColor',[0.83 0.81 0.78],'enable','off');
uicontrol(h0,'style','text','string','初 值:','position',[30 160 60 30],'FontSize',10);
h_x0 = uicontrol(h0,'style','edit','position',[90 160 360 30],'FontSize',10,'BackgroundColor',[0.83 0.81 0.78],'enable','off');
uicontrol(h0,'style','text','string','方 程 解:','position',[30 110 60 30],'FontSize',10);
h_result = uicontrol(h0,'style','text','position',[90 50 365 90],'FontSize',8,'BackgroundColor',[0.6 0.7 0.6],'tag','result');
h_ok = uicontrol(h0,'style','pushbutton','position',[110 20 60 30],'FontSize',15,'string','ok','callback','func_on_ok');
h_clear = uicontrol(h0,'style','pushbutton','position',[220 20 60 30],'FontSize',15,'string','clear','callback','clear_Callback');
h_close = uicontrol(h0,'style','pushbutton','position',[340 20 60 30],'FontSize',15,'string','close','callback','close');



