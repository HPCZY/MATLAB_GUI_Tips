function Hobj = GUI3(mainFig)

Hobj.Fig = figure('Name','定义文本','Position',[700,200,300,170],...    
    'color',[.9,.9,.9],'menu','none','NumberTitle','off');
Hobj.ed = uicontrol(Hobj.Fig,'style','edit','String',[],'Fontsize',20,...
    'Units','normalized','Position',[0,0,1,1],'Callback',@doit);

    function doit(src,event)
        txt = get(src,'string');
        set(mainFig.txt,'string',txt)
    end

end

