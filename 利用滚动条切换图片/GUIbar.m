function GUIbar(imgList)

imgNum = length(imgList);

%%
WH = 600;
WW = 600;
BH = 80;

% 界面
Fig = figure('Position',[650,350,WW,WH],'Name','GUI',...
    'Color','white','menu','none','NumberTitle','off');
% 绘图窗
Axes1 = axes(Fig,'Units','pixels','Position',[0,20+BH,WW,WH-20-BH]);
Axes2 = axes(Fig,'Units','pixels','Position',[0,20,WW,BH]);
% 滚动条
Sd = uicontrol(Fig,'style','slider','Callback',@ShowImage,...
    'Unit','pixels','Position',[0,0,WW,20],...
    'Min',1,'Max',imgNum,'Value',1,'SliderStep',[1/imgNum,1/imgNum]);

%% 基本参数
imgbar = [];
imgidx = 1;

%% 生成bar
[rows,cols,~] = size(imgList{1});
brow = BH;
bcol = floor(BH/rows*cols);
for n = 1:imgNum
    imgbar = cat(2,imgbar, imresize(imgList{n},[brow,bcol]));
end
set(Axes2,'Position',[0,20,bcol*imgNum,BH])
imshow(imgbar,'Parent',Axes2)

ShowImage();

    function ShowImage(~,~)
        imgidx = round(get(Sd,'Value'));
        a = (imgidx-1)*(bcol*imgNum-WW)/(imgNum-1)+1;
        set(Axes2,'Position',[-a,20,bcol*imgNum,BH])
        imshow(imgList{imgidx},'Parent',Axes1)
    end

end