%��ֵ����ʵ��:��"��Ԫѡȡ���㷨�ȶ���"��"���Դ������������̬����������������"
%���������:ͼ�ν��潻��ʽ�������
%�Ӻ�������:func_on_ok/on_approach/matr_Callback/clear_Callback
%�ֱ�Ϊ:"ok"��ť��Ӧ�������㷨ѡ����Ӧ��������ȡ�������롢"clear��ť��Ӧ����"
global h0 h_matr h_msize h_vect h_appr h_main_e h_err h_sw h_x0 h_close h_clear h_result
h0 = figure(1);
set(h0,'resize','off');
uicontrol(h0,'style','text','string','����:','position',[30 360 60 30],'Fontsize',10);
h_matr = uicontrol(h0,'style','popupmenu','string',{'���� A','���� H','����'},...
'position',[90 360 90 30],'Fontsize',10);
set(h_matr,'BackgroundColor',[1 1 1],'callback','matr_Callback');
uicontrol(h0,'style','text','string','�����С:','position',[250 360 100 30],'FontSize',10);
h_msize = uicontrol(h0,'style','edit','string','10','position',[350 360 100 30],'FontSize',10);
uicontrol(h0,'style','text','string','����b:','position',[30 310 60 30],'FontSize',10);
h_vect = uicontrol(h0,'style','edit','string',['7 15 15 15 15 15 15 15 15 14'],'position',[90 310 360 30]);
set(h_vect,'FontSize',10,'BackgroundColor',[1 1 1]);
uicontrol(h0,'style','text','string','�� ��:','position',[30 260 60 30],'FontSize',10);
h_appr = uicontrol(h0,'style','popupmenu','string',{'Gauss��Ԫ��';'J������';'GS������';'SOR������'},...
'position',[90 260 110 30],'FontSize',10,'BackgroundColor',[1 1 1],'callback','on_approach');
uicontrol(h0,'style','text','string','��Ԫѡ��:','position',[250 260 100 30],'FontSize',10);
h_main_e = uicontrol(h0,'style','popupmenu','string',{'��ѡ��Ԫ','�Զ�ѡ��Ԫ','�ֶ�ѡ��Ԫ'},...
'position',[350 260 100 30],'FontSize',10,'BackgroundColor',[1 1 1]);
uicontrol(h0,'style','text','string','�����:','position',[30 210 60 30],'FontSize',10);
h_err = uicontrol(h0,'style','edit','string','1.0e-6',...
'position',[90 210 90 30],'FontSize',10,'BackgroundColor',[0.83 0.81 0.78],'enable','off');
uicontrol(h0,'style','text','string','�ɳ����� w:','position',[250 210 100 30],'FontSize',10);
h_sw = uicontrol(h0,'style','edit','string','1.25',...
'position',[350 210 100 30],'FontSize',10,'BackgroundColor',[0.83 0.81 0.78],'enable','off');
uicontrol(h0,'style','text','string','�� ֵ:','position',[30 160 60 30],'FontSize',10);
h_x0 = uicontrol(h0,'style','edit','position',[90 160 360 30],'FontSize',10,'BackgroundColor',[0.83 0.81 0.78],'enable','off');
uicontrol(h0,'style','text','string','�� �� ��:','position',[30 110 60 30],'FontSize',10);
h_result = uicontrol(h0,'style','text','position',[90 50 365 90],'FontSize',8,'BackgroundColor',[0.6 0.7 0.6],'tag','result');
h_ok = uicontrol(h0,'style','pushbutton','position',[110 20 60 30],'FontSize',15,'string','ok','callback','func_on_ok');
h_clear = uicontrol(h0,'style','pushbutton','position',[220 20 60 30],'FontSize',15,'string','clear','callback','clear_Callback');
h_close = uicontrol(h0,'style','pushbutton','position',[340 20 60 30],'FontSize',15,'string','close','callback','close');



