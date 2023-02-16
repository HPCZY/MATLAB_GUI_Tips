function GUI()

close all;clc
%% 主界面
bg = imread('bg.jpeg');
[Ht,Wt,~] = size(bg);
main.Fig = figure('Name','装备栏','Position',[400,300,Wt,Ht],...
    'color',[.9,.9,.9],'menu','none','NumberTitle','off');
main.Axes = axes(main.Fig,'Units','normalized','Position',[0,0,1,1]);
imshow(bg,'Parent',main.Axes);

%% 装备栏
cols = 9;
for c = 1:cols
    pos = [(c-1),0,1,1]*48+[400,50,0,0];
    uicontrol(main.Fig,'style','pushbutton','String',[],...
        'Units','pixels','Position',pos,'Callback',@backpack);
end

%% 背包
main.iconAll = IconRead('all.png',[512,512],1);



    function backpack(src,event)
        subGUI(main,src);
    end

end

function subGUI(mainFig,mainSrc)

[Ht,Wt,~] = size(mainFig.iconAll);
subPos = [350+mainFig.Fig.Position(1),150+mainFig.Fig.Position(2),Wt,Ht];
Fig = figure('Name','背包','Position',subPos,...
    'color',[.9,.9,.9],'menu','none','NumberTitle','off');

rows = 16;
cols = 16;
iconsize = 32;
for r = 1:rows
    for c = 1:cols
        x = (r-1)*iconsize;
        y = (c-1)*iconsize;
        icon = mainFig.iconAll(x+1:x+iconsize,y+1:y+iconsize,:);
        pos = [(c-1)/cols,(rows-r)/rows,1/cols,1/rows]*Wt;
        uicontrol(Fig,'style','pushbutton','String',[],'CData',icon,...
            'Units','pixels','Position',pos,'Callback',@choose);
    end
end

    function choose(src,event)
        equip = get(src,'CData');
        set(mainSrc,'CData',equip)
        delete(Fig)
    end

end