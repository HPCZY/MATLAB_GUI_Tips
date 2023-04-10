% close all; clc

GUIcolor()

function GUIcolor()

%% 界面
WH = 120;
WW = 512+WH*2;
Fig = figure('Position',[650,650,WW,WH],'Name','GUI',...
    'Color','white','menu','none','NumberTitle','off');
Fig.Resize = 'off';
% 交互
set(Fig,'WindowButtonDownFcn',@ButtonDown);
% 绘图窗
Axes1 = axes(Fig,'Units','pixels','Position',[0,40,512,80]);
Axes2 = axes(Fig,'Units','pixels','Position',[512,0,WH,WH]);
Axes3 = axes(Fig,'Units','pixels','Position',[512+WH,0,WH,WH]);
% 滚动条
Sd = uicontrol(Fig,'style','slider','Callback',@ChangeColor,...
    'Unit','pixels','Position',[0,0,512,40],...
    'Min',0,'Max',256,'Value',128,'SliderStep',[1/256,1/20]);

%% 颜色条
% bar
hsibar = [0:255,0:255]/255;
rgbbar = getRGBbar(hsibar);
% pool
hpool = ones(256);
spool = ones(256,1)*(255:-1:0)/255;
ipool = spool';
% color
x = 127;
y = 127;
mycolor = [0,0,0];

ChangeColor();

%%
    function ChangeColor(~,~)
        colorid = round(get(Sd,'Value'));

        rgb = rgbbar(:,colorid:colorid+255,:);
        imshow(rgb,'Parent',Axes1)

        rgbpool = hsv2rgb(hpool*hsibar(colorid+128),spool,ipool);
        imshow(rgbpool,'Parent',Axes2)

        rgbcolor = rgbpool(x,y,:);
        imshow(rgbcolor,'Parent',Axes3)

        mycolor = squeeze(rgbcolor);
        disp(mycolor)
    end

    function ButtonDown(~,~)
        cp = get(gca,'currentpoint');
        x = round(cp(1,2));
        y = round(cp(1,1));
        ChangeColor();
    end

    function rgbbar = getRGBbar(hsibar)
        h = ones(40,1)*hsibar;
        s = ones(size(h));
        rgbbar = hsv2rgb(h,s,s);
    end

end
