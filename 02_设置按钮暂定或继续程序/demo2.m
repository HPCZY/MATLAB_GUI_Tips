clear; close all; clc

GUI2()

function GUI2()

Fig = figure('Name','GI','Color','white',...
    'menu','none','NumberTitle','off');

bt = uicontrol(Fig,'style','togglebutton','String','||','Fontsize',16,...
    'Units','normalized','Position',[0,0,1,0.1],'Callback',@do);

Axes = axes(Fig,'Position',[0,0.1,1,0.9]);

while 1
    imshow(rand(100),'Parent',Axes)
    drawnow
end

    function do(~,~)
        state = get(bt,'Value');
        if state
            set(bt,'String','>>');
            uiwait(Fig)            
        else            
            uiresume(Fig)
            set(bt,'String','||');
        end
    end

end



function GUI()

Fig = figure('Name','GI','Color','white',...
    'menu','none','NumberTitle','off');

uicontrol(Fig,'style','pushbutton','String','¼ÌÐø','Fontsize',16,...
    'Units','normalized','Position',[0,0,0.5,0.1],'Callback',@do);
uicontrol(Fig,'style','pushbutton','String','ÔÝÍ£','Fontsize',16,...
    'Units','normalized','Position',[0.5,0,0.5,0.1],'Callback',@dont);

Axes = axes(Fig,'Position',[0,0.1,1,0.9]);

while 1
    imshow(rand(100),'Parent',Axes)
    drawnow
end

    function do(~,~)
        uiresume(Fig)
    end
    function dont(~,~)
        uiwait(Fig)
    end
end