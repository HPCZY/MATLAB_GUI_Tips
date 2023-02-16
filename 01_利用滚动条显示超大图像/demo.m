clear; close all; clc

img = imread('test.jpeg');
imshowGUI(img)

function imshowGUI(img)

wt = 1200;
ht = 800;
bs = 30;

[rows,cols,~] = size(img);

%% 搭框架
Fig = figure('Position',[200,100,wt,ht],'menu','none');
Fig.ResizeFcn = @ResizeWindow;
% 面板
Pnl = uipanel(Fig,'Units','Pixels','Position',[0,30,wt-bs,ht-bs]);
% 绘图窗
Axes = axes(Pnl,'Unit','Pixels','Position',[0,0,cols,rows]);
Lbx = uicontrol(Fig,'style','slider',...
    'Unit','Pixels','Position',[0,0,wt-bs,bs],...
    'Max',1,'Min',0,'Value',0.5,...
    'Callback',@Move);
Lby = uicontrol(Fig,'style','slider',...
    'Unit','Pixels','Position',[wt-bs,bs,bs,ht-bs],...
    'Max',1,'Min',0,'Value',0.5,...
    'Callback',@Move);  

%% 初始化
dx = cols-Pnl.Position(3);
dy = rows-Pnl.Position(4);

%% 显示
Move()
imshow(img,'Parent',Axes)

%% 子函数
    function Move(~,~)
        x = get(Lbx,'Value');
        y = get(Lby,'Value');
        Axes.Position(1:2) = [-x*dx,-y*dy];
    end

    function ResizeWindow(~,~) 
        FigSize = Fig.Position(3:4);
        if FigSize(1)>=100 && FigSize(2)>=100            
            Pnl.Position(3:4) = FigSize-bs;
            PnlSize = Pnl.Position(3:4);       
            % 更新权值
            dx = cols-PnlSize(1);
            dy = rows-PnlSize(2);
            % Lb拉长
            Lbx.Position(3) = FigSize(1)-bs;   
            Lby.Position([1,4]) = [FigSize(1)-bs,FigSize(2)-bs];             
        end
    end

end


































