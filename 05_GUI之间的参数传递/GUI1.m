function GUI1()

main.Fig = figure('Name','自定义图标','Position',[400,200,300,300],...    
    'color',[.9,.9,.9],'menu','none','NumberTitle','off');
main.Fig.DeleteFcn = @doit;

main.bt = uicontrol(main.Fig,'style','pushbutton','String',[],'Fontsize',20,...
    'Units','normalized','Position',[0,0.5,1,0.5]);
main.txt = uicontrol(main.Fig,'style','text','String',[],'Fontsize',20,...
    'Units','normalized','Position',[0,0,1,0.5]);
main.param = 0;

colorFig = GUI2(main);
textFig = GUI3(main);

    function doit(src,event)
           delete(colorFig.Fig)
           delete(textFig.Fig)
           delete(main.Fig)
    end
end

