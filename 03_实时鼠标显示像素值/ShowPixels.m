
function ShowPixels(img)

[rows,cols,dims] = size(img);

%% ����
Fig = figure('Name','�鿴����ֵ','Position',[200,200,cols,rows],...
    'menu','none','Color','white','NumberTitle','off');
Fig.Resize = 'off';
set(Fig,'WindowButtonDownFcn',@ButtonDown);
set(Fig,'WindowButtonUpFcn',@ButtonUp);
set(Fig,'WindowButtonMotionFcn',@ButtonMotion);

%% �ؼ�
Pnl = uipanel(Fig,'Position',[0,0,1,1]);
Axes = axes(Pnl,'Position',[0,0,1,1]);
Text = uicontrol(Pnl,'style','text',...
    'String',[],'Fontsize',12,...
    'Units','pixels','Position',[0,0,120,80],...
    'Visible','off');

%% ����
state = 0;
imshow(img,'Parent',Axes)

%% ����

    function ButtonDown(~,~)
        state = 1;
        cp = get(gca,'currentpoint');
        TipsUpdata(cp)
        Text.Visible = 'on';
    end

    function ButtonUp(~,~)
        if state
            state = 0;
            Text.Visible = 'off';
        end
    end

    function ButtonMotion(~,~)
        if state
            cp = get(gca,'currentpoint');
            TipsUpdata(cp)
        end
    end

    function TipsUpdata(cp)
        x = min(max(1,round(cp(1,1))),cols);
        y = min(max(1,round(cp(1,2))),rows);
        val = squeeze(img(y,x,:));
        
        if x>cols-Text.Position(3)
            x = x-Text.Position(3);
        end
        if y<Text.Position(4)
            y = y+Text.Position(4);
        end
        
        
        Text.Position(1:2) = [x,rows-y];
        
        if dims<3
            Text.String = {['x: ',num2str(x)],['y: ',num2str(y)],...
                ['val: ',num2str(val)]};
        else
            Text.String = {['x: ',num2str(x)],['y: ',num2str(y)],...
                ['rgb: [',num2str(val(1)),',',num2str(val(2)),',',num2str(val(3)),']']};
        end
        
    end

end