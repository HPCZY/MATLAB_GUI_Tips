function GUIfig(imgList)

imgNum = length(imgList);

%% 界面
Fig = figure('Position',[450,150,1000,700],'Name','GUI',...
    'Color','white','menu','none','NumberTitle','off');

% 绘图窗
Axes = axes(Fig,'Units','normalized','Position',[0,0,0.95,1]);
% 滚动条
Sd = uicontrol(Fig,'style','slider','Callback',@ShowImage,...
    'Unit','normalized','Position',[0.95,0,0.05,1],...
    'Min',1,'Max',imgNum,'Value',imgNum,'SliderStep',[1,1]/imgNum);

%% 基本参数
imgIdx = 1;
ShowImage();

    function ShowImage(~,~)        
        imgIdx = round(imgNum+1-get(Sd,'Value'));
        image = imgList{imgIdx};
        imshow(image,'Parent',Axes)
    end

end